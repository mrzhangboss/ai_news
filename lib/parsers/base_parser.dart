import 'dart:convert';

import 'package:http/http.dart';

import '../models/news.dart';

abstract class BaseParser {
  String getDownloadUrl();

  Future<void> prepare() async {
    await Future.delayed(Duration.zero);
  }

  News parseNews(Map<String, dynamic> json, int rank);

  void dispose() async {
    await Future.delayed(Duration.zero);
  }

  bool isSuccess(Response response) {
    return response.statusCode == 200;
  }

  List<dynamic> getArticles(Response response) {
    String responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);
    return json.decode(responseBody)['data'] as List<dynamic>;
  }
}
