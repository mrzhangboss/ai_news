import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news.dart';

class NewsService {
  Future<List<News>> getNews() async {
    final headers = {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    };
  print('begin');

    final response = await http.get(
        Uri.parse(
            'https://www.zhihu.com/api/v3/feed/topstory/hot-lists/total?limit=50&desktop=true'),
        headers: headers);

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      final jsonData = json.decode(responseBody);
      final articles = jsonData['data'] as List<dynamic>;
      return List.generate(articles.length,
          (index) => ZhiHuNews.fromJson(articles[index], index + 1));
    } else {
      print('end ${response.statusCode}');

      throw Exception(
          'Failed to load news ${response.statusCode} : ${response.body}');
    }
  }
}
