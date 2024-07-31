import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/constant.dart';
import '../models/news.dart';
import '../parsers/base_parser.dart';
import '../parsers/juejin_parser.dart';
import '../parsers/toutiao_parser.dart';
import '../parsers/zhihu_parser.dart';

class NewsService {
  final NewsType newsType;

  NewsService({required this.newsType});

  ZhihuParser zhihuParser = ZhihuParser();
  ToutiaoParser toutiaoParser = ToutiaoParser();
  JuejinParser juejinParser = JuejinParser();

  BaseParser getParser(NewsType type) {
    switch (type) {
      case NewsType.zhihu:
        return zhihuParser;
      case NewsType.toutiao:
        return toutiaoParser;
      case NewsType.juejin:
        return juejinParser;
      default:
        return zhihuParser;
    }
  }

  Future<List<News>> getNews(Function(List<News>)? callback) async {
    final headers = {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    };
    print('begin');
    BaseParser parser = getParser(newsType);
    final response =
        await http.get(Uri.parse(parser.getDownloadUrl()), headers: headers);

    if (parser.isSuccess(response)) {
      await parser.prepare();
      final articles = parser.getArticles(response);
      List<News> news = List.generate(articles.length,
          (index) => parser.parseNews(articles[index], index + 1));
      if (callback != null) {
        callback(news);
      }
      return news;
    } else {
      print('end ${response.statusCode}');

      throw Exception(
          'Failed to load news ${response.statusCode} : ${response.body}');
    }
  }
}
