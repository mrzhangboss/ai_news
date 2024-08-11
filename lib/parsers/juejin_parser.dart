import 'package:ai_news/database/article_model.dart';
import 'package:ai_news/models/news.dart';

import '../database/constant.dart';
import '../models/constant.dart';
import 'base_parser.dart';

class JuejinParser extends BaseParser {
  @override
  String getDownloadUrl() {
    return 'https://api.juejin.cn/content_api/v1/content/article_rank?category_id=1&type=hot';
  }

  @override
  Article parseArticle(Map<String, dynamic> json, int rank) {
    var id = json['content']['content_id'];
    var like = json['content_counter']['like'];
    var note = '${like}人喜欢';
    final url = 'https://juejin.cn/post/$id';
    final content = ArticleContent()
      ..backgroundIcon = json['author']?['avatar']
      ..author = json['author']['name'];
    final article = Article()
      ..type = ArticleType.juejin
      ..rank = rank
      ..title = json['content']['title']
      ..url = url
      ..content = content
      ..hot = note;

    return article;
  }
}
