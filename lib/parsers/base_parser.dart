import 'dart:convert';

import 'package:http/http.dart';

import '../database/article_model.dart';
import '../models/news.dart';

abstract class BaseParser {
  String getDownloadUrl();

  Future<void> prepare() async {
    await Future.delayed(Duration.zero);
  }

  Article parseArticle(Map<String, dynamic> json, int rank);

  void dispose() async {
    await Future.delayed(Duration.zero);
  }

  bool isSuccess(Response response) {
    return response.statusCode == 200;
  }

  List<dynamic> getOriginArticles(Response response) {
    String responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);
    return json.decode(responseBody)['data'] as List<dynamic>;
  }

  List<Article> getArticles(Response response) {
    final articles = getOriginArticles(response);
    List<Article> res = List.generate(articles.length,
            (index) => parseArticle(articles[index], index + 1));
    return res;

  }
}
