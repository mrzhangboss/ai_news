import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news.dart';
import '../models/news_factors.dart';

class NewsService {
  final NewsType newsType;

  NewsService({required this.newsType});

  String getUrl() {
    switch (newsType) {
      case NewsType.zhihu:
        return 'https://www.zhihu.com/api/v3/feed/topstory/hot-lists/total?limit=50&desktop=true';
      case NewsType.toutiao:
        return 'https://api.vvhan.com/api/hotlist/toutiao';
      case NewsType.juejin:
        return 'https://api.juejin.cn/content_api/v1/content/article_rank?category_id=1&type=hot';
      default:
        return '';
    }
  }

  Future<List<News>> getNews(Function(List<News>)? callback) async {
    final headers = {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    };
    print('begin');
    final url = getUrl();
    if (url.isEmpty) {
      return [];
    }
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      final jsonData = json.decode(responseBody);
      final articles = jsonData['data'] as List<dynamic>;
      List<News> news = List.generate(
          articles.length,
          (index) =>
              NewsFactors.buildNews(articles[index], index + 1, newsType));
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
