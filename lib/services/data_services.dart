import 'package:ai_news/models/ai_model.dart';
import 'package:ai_news/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/constant.dart';
import '../models/news.dart';
import 'ai_services.dart';

class DataServices extends ChangeNotifier {
  final String _historyBoxName = '_history';
  final String _commentBoxName = '_comment';
  final String _cacheDateBoxName = '_cache_date';
  late Box<News> _historyBox;
  late Box<Comment> _commentBox;
  late Box<DateTime> _cacheDateBox;
  List<NewsType> boxTypes = [
    NewsType.recommend,
    NewsType.zhihu,
    NewsType.juejin,
    NewsType.toutiao
  ];
  bool isBoxInitialized = false;
  late AiServices aiServices;

  List<String> tags = ["", "科技", "热点", "技术", "时事"];

  DataServices() {
    print('init box');
    _initBox();
    aiServices = const AiServices(
        token:
            'pat_eLMTCUMzhKmMCbDhBInOjktNwUorUclPAryRXpiRcNSYoLIczwOG3V8nDlgIRTq1',
        robotId: '7394426221524058148');
  }

  _initBox() async {
    for (NewsType type in boxTypes) {
      String boxName = getBoxName(type);
      await Hive.openBox<News>(boxName);
    }
    _historyBox = await Hive.openBox<News>(_historyBoxName);
    _commentBox = await Hive.openBox<Comment>(_commentBoxName);
    // _commentBox.clear();
    _cacheDateBox = await Hive.openBox<DateTime>(_cacheDateBoxName);
    // await _commentBox.clear();
    isBoxInitialized = true;
  }

  String getBoxName(NewsType newsType) {
    return newsType.toString().split(".").last;
  }

  bool isNeedUpdate(NewsType newsType) {
    if (!isBoxInitialized || newsType == NewsType.recommend) {
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
    if (NewsType.recommend == newsType) {
      Future.delayed(Duration.zero, generateRecommendNews);
    }
    return Hive.box<News>(boxName).values.toList();
  }

  List<News> getNewsByFilter(bool Function(Comment) filter, [int size = -1]) {
    List<News> news = _commentBox.values
        .where(filter)
        .where((e) => _historyBox.containsKey(generateBoxKeyId(e.type, e.id)))
        .map((e) => _historyBox.get(generateBoxKeyId(e.type, e.id))!)
        .toList();
    news.sort((a, b) => b.createAt.compareTo(a.createAt));
    if (size > 0) {
      return news.take(size).toList();
    }
    return news;
  }

  Future<void> generateRecommendNews() async {
    print('history size ${_historyBox.length}');
    var recommendBox = Hive.box<News>(getBoxName(NewsType.recommend));

    // 当前推荐的新闻全部设置为已读
    for (var news in recommendBox.values.toList()) {
      var comment = getComment(news);
      await _commentBox.put(
          generateBoxKeyId(news.type, news.id), comment.copyWith(isRead: true));
    }

    // 获取历史最近30条新闻
    const recommendSize = 15;
    var currentSize = 0;
    var index = _historyBox.length - 1;
    List<AiModel> latestNews = [];
    while (index >= 0 && currentSize < recommendSize) {
      News item = _historyBox.getAt(index)!;
      var comment = getComment(item);
      if (!comment.isRead) {
        latestNews.add(AiModel(
            type: item.type,
            id: item.id,
            title: item.title,
            description: item.description));
        currentSize++;
      }
      index--;
    }
    print('latestNews size ${latestNews.length}');
    latestNews = await aiServices.getAiCategoryResponse(latestNews);
    List<News> likeNews =
        getNewsByFilter((element) => element.isLiked == true, 100);
    List<News> dislikeNews =
        getNewsByFilter((element) => element.isLiked == false, 100);
    List<News> clickedNews =
        getNewsByFilter((element) => element.isClicked == true, 50);
    latestNews = await aiServices.getAiSortResponse(
        likeNews, dislikeNews, clickedNews, latestNews);
    List<News> recommendNews = [];
    latestNews.sort((a, b) => -1 * (a.sort ?? 0).compareTo((b.sort ?? 0)));
    Set<String> tagsSet = tags.toSet();
    for (var item in latestNews) {
      Comment comment = getCommentById(item.type, item.id);
      if (item.category != null) {
        if (!tagsSet.contains(item.category)) {
          tagsSet.add(item.category!);
        }
      }
      await _commentBox.put(
          generateBoxKeyId(item.type, item.id),
          comment.copyWith(
              category: item.category, like: item.like, sort: item.sort));
      recommendNews.add(_historyBox.get(generateBoxKeyId(item.type, item.id))!);
    }

    // print(lines.join("\n"));
    await recommendBox.clear();
    await recommendBox.addAll(recommendNews);
    notifyListeners();
  }

  String getBoxKeyId(News news) {
    return generateBoxKeyId(news.type, news.id);
  }

  String generateBoxKeyId(NewsType type, String id) {
    return '${type.toString().split('.').last}-${id}';
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
      _historyBox.put(boxKeyId, item);
      await box.put(boxKeyId, item);
    }
    await _cacheDateBox.put(boxName, DateTime.now());
    notifyListeners();
    print('end saveNews');
  }

  Comment getComment(News news) {
    return getCommentById(news.type, news.id);
  }

  Comment getCommentById(NewsType newsType, String id) {
    if (!isBoxInitialized) {
      return Comment(
        type: newsType,
        id: id,
      );
    }
    String boxKeyId = generateBoxKeyId(newsType, id);
    if (_commentBox.containsKey(boxKeyId)) {
      return _commentBox.get(boxKeyId)!;
    } else {
      return Comment(
        type: newsType,
        id: id,
      );
    }
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

  void clickNews(News news) async {
    String boxKeyId = getBoxKeyId(news);
    Comment comment = getComment(news);

    await _commentBox.put(
        boxKeyId,
        comment.copyWith(
            readAt: DateTime.now(),
            isClicked: true,
            isRead: true,
            readTimes: comment.readTimes + 1));
    notifyListeners();
  }
}
