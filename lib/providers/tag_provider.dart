import 'package:ai_news/database/article_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../database/constant.dart';

class TagProvider extends ChangeNotifier {
  final Isar isar;

  TagProvider(this.isar);

  String _currentTag = '';

  String get currentTag => _currentTag;

  set currentTag(String tag) {
    _currentTag = tag;
    notifyListeners();
  }



  // 添加标签
  void addTag(String tag, [OpinionType opinionType = OpinionType.neutral]) {
    final newTag = Tag()..tagName = tag .. opinion = opinionType;
    isar.writeTxnSync(() async {
      isar.tags.putSync(newTag);
    });
    notifyListeners();
  }
  // 添加标签
  void addTags(List<String> tag, [OpinionType opinionType = OpinionType.neutral]) {
    isar.writeTxnSync(() async {
      for (var tag in tag) {
        final newTag = Tag()..tagName = tag .. opinion = opinionType;
        isar.tags.putSync(newTag);
      }
    });
    notifyListeners();
  }

  // 获取所有标签

  final defaultTags = ['科技', '军事', '财经', '体育', '娱乐'];

  List<Tag> getAllTags() {
    List<Tag> tag = isar.tags.where().findAllSync();
    if (tag.isEmpty) {
      isar.writeTxnSync(() {
        for (var tag in defaultTags) {
          isar.tags.putSync(Tag()..tagName = tag);
        }
      });
      tag = isar.tags.where().findAllSync();
    }
    return tag;
  }

  // 删除标签

  void deleteTag(String tag) {
    isar.writeTxnSync(() {
      isar.tags.deleteByTagNameSync(tag);
    });
    notifyListeners();
  }
}
