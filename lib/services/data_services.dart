import 'package:ai_news/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/constant.dart';
import '../models/news.dart';

class DataServices extends ChangeNotifier {
  final String _historyBoxName = '_history';
  final String _commentBoxName = '_comment';
  final String _cacheDateBoxName = '_cache_date';
  late Box<News> _historyBox;
  late Box<Comment> _commentBox;
  late Box<DateTime> _cacheDateBox;
  List<NewsType> boxTypes = [NewsType.zhihu, NewsType.juejin, NewsType.toutiao];
  bool isBoxInitialized = false;

  DataServices() {
    print('init box');
    _initBox();
  }

  _initBox() async {
    for (NewsType type in boxTypes) {
      String boxName = getBoxName(type);
      await Hive.openBox<News>(boxName);
    }
    _historyBox = await Hive.openBox<News>(_historyBoxName);
    _commentBox = await Hive.openBox<Comment>(_commentBoxName);
    _cacheDateBox = await Hive.openBox<DateTime>(_cacheDateBoxName);
    // await _commentBox.clear();
    isBoxInitialized = true;
  }

  String getBoxName(NewsType newsType) {
    return newsType.toString().split(".").last;
  }

  bool isNeedUpdate(NewsType newsType) {
    if (!isBoxInitialized) {
      return false;
    }
    DateTime? lastCacheTime = _cacheDateBox.get(getBoxName(newsType));
    if (lastCacheTime == null) {
      return true;
    }
    var now = DateTime.now();
    if (now.isAfter(lastCacheTime.add(const Duration(seconds: 30)))) {
      return true;
    }
    return false;
  }

  List<News> getCategoryNews(NewsType newsType) {
    String boxName = getBoxName(newsType);
    if (!isBoxInitialized) {
      return [];
    }
    return Hive.box<News>(boxName).values.toList();
  }

  String getBoxKeyId(News news) {
    return '${news.type.toString().split('.').last}-${news.id}';
  }

  void saveNews(List<News> news) async {
    NewsType newsType = news.first.type;
    String boxName = getBoxName(newsType);
    var box = Hive.box<News>(boxName);
    if (!box.isOpen) {
      await Hive.openBox<News>(boxName);
    }
    await box.clear();
    for (var item in news) {
      var boxKeyId = getBoxKeyId(item);
      if (_historyBox.containsKey(boxKeyId)) {
        _historyBox.put(boxKeyId, item);
      }
      await box.put(boxKeyId, item);
    }
    await _cacheDateBox.put(boxName, DateTime.now());
    notifyListeners();
    print('end saveNews');
  }

  Comment getComment(News news) {
    if (!isBoxInitialized) {
      return Comment(
        type: news.type,
        id: news.id,
      );
    }
    String boxKeyId = getBoxKeyId(news);
    if (_commentBox.containsKey(boxKeyId)) {
      return _commentBox.get(boxKeyId)!;
    }
    var newComment = Comment(
      type: news.type,
      id: news.id,
    );
    _commentBox.put(boxKeyId, newComment);
    return newComment;
  }

  bool isShow(News news) {
    Comment comment = getComment(news);
    return comment.isLiked == false;
  }

  bool isLiked(News news) {
    Comment comment = getComment(news);
    return comment.isLiked == true;
  }

  void likeNews(News news) async {
    String boxKeyId = getBoxKeyId(news);
    Comment comment = getComment(news);

    await _commentBox.put(boxKeyId, comment.copyWith(isLiked: true));
    notifyListeners();
  }

  void dislikeNews(News news) async {
    String boxKeyId = getBoxKeyId(news);
    Comment comment = getComment(news);

    await _commentBox.put(boxKeyId, comment.copyWith(isLiked: false));
    notifyListeners();
  }

  void readNews(News news) async {
    String boxKeyId = getBoxKeyId(news);
    Comment comment = getComment(news);

    await _commentBox.put(
        boxKeyId,
        comment.copyWith(
            readAt: DateTime.now(),
            isRead: true,
            readTimes: comment.readTimes + 1));
    notifyListeners();
  }
}
