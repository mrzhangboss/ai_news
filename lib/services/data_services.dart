import 'package:ai_news/models/toutiao_news.dart';
import 'package:ai_news/models/zhihu_news.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/juejin_news.dart';
import '../models/news.dart';

class DataServices extends ChangeNotifier {
  final String zhihuBoxKey = 'zhihu_box';
  final String toutiaoBoxKey = 'toutiao_box';
  final String juejinBoxKey = 'juejin_box';
  late Box<ZhiHuNews> zhihuBox;
  late Box<ToutiaoNews> toutiaoBox;
  late Box<JuejinNews> juejinBox;
  bool isBoxInitialized = false;

  DataServices() {
    print('init box');
    _initBox();
  }

  _initBox() async {
    zhihuBox = await Hive.openBox<ZhiHuNews>(zhihuBoxKey);
    toutiaoBox = await Hive.openBox<ToutiaoNews>(toutiaoBoxKey);
    juejinBox = await Hive.openBox<JuejinNews>(juejinBoxKey);
    isBoxInitialized = true;
  }

  List<News> getCategoryNews(NewsType newsType) {
    if (!isBoxInitialized) {
      print('isBoxInitialized is false $newsType');
      return [];
    }
    switch (newsType) {
      case NewsType.zhihu:
        print('${zhihuBox.isOpen} zhihuBox.isOpen');
        return zhihuBox.values.toList();
      case NewsType.toutiao:
        print('db size ${toutiaoBox.values.length}');
        return toutiaoBox.values.toList();
      case NewsType.juejin:
        return juejinBox.values.toList();
      default:
        return [];
    }
  }

  void saveNews(List<News> news) async {
    print('begin saveNews ${news.length}');
    if (!isBoxInitialized || news.isEmpty) {
      return;
    }
    NewsType newsType = news.first.type;
    switch (newsType) {
      case NewsType.zhihu:
        await zhihuBox.clear();
        for (var item in news) {
          await zhihuBox.add(item as ZhiHuNews);
        }
        break;
      case NewsType.toutiao:
        await toutiaoBox.clear();
        for (var item in news) {
          await toutiaoBox.add(item as ToutiaoNews);
        }
      case NewsType.juejin:
        await juejinBox.clear();
        for (var item in news) {
          await juejinBox.add(item as JuejinNews);
        }
      default:
        break;
    }
    notifyListeners();
    print('end saveNews');
  }
}
