import 'package:ai_news/models/news.dart';

import '../database/article_model.dart';
import '../database/constant.dart';
import '../models/constant.dart';
import 'base_parser.dart';

class ZhihuParser extends BaseParser {
  @override
  String getDownloadUrl() {
    return 'https://www.zhihu.com/api/v3/feed/topstory/hot-lists/total?limit=50&desktop=true';
  }

  static String convertReadApiUrl(String questionId) {
    return 'https://zhihu.com/question/$questionId';
  }

  @override
  Article parseArticle(Map<String, dynamic> json, int rank) {
    final content = ArticleContent()
      .. description = json['target']['excerpt']
      ..backgroundIcon = json['children'].isNotEmpty && json['children'][0]['thumbnail'].isNotEmpty ? json['children'][0]['thumbnail']  : null
      ..author = json['target']['author']['name'];
    final article = Article()
      ..type = ArticleType.zhihu
      ..rank = rank
      ..title = json['target']['title']
      ..url = convertReadApiUrl(json['target']['id'].toString())
      ..content = content
      ..hot = json['detail_text'];
    return article;
  }
}
