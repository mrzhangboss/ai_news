import 'package:ai_news/models/news.dart';
import 'package:http/http.dart';

import '../database/article_model.dart';
import '../database/constant.dart';
import '../models/constant.dart';
import 'base_parser.dart';

class ToutiaoParser extends BaseParser {
  @override
  String getDownloadUrl() {
    return 'https://api.vvhan.com/api/hotlist/all';
  }

  ArticleType getType(String type) {
    switch (type) {
      case 'wbHot':
        return ArticleType.weibo;
      case 'toutiao':
        return ArticleType.toutiao;
      case 'huPu':
        return ArticleType.huPu;
      case 'zhihuDay':
        return ArticleType.zhihuDay;
      case '36Ke':
        return ArticleType.three6Ke;
      case 'bili':
        return ArticleType.bilibili;
      case 'baiduRD':
        return ArticleType.baiduRD;
      case 'douyinHot':
        return ArticleType.douyinHot;
      case 'douban':
        return ArticleType.douban;
      case 'huXiu':
        return ArticleType.huXiu;
      case 'woShiPm':
        return ArticleType.woShiPm;
      default:
        return ArticleType.zhihu;
    }
  }

  @override
  Article parseArticle(Map<String, dynamic> json, int rank) {
    Uri uri = Uri.parse(json['url']);
    final content = ArticleContent();
    final article = Article()
      ..type = getType(json['type'])
      ..rank = json['index']
      ..title = json['title']
      ..url = json['mobil_url']
      ..content = content
      ..hot = json['hot'];
    return article;
  }

  @override
  List<Article> getArticles(Response response) {
    final articles = getOriginArticles(response);
    List<Article> res = [];
    for (var group in articles) {
      for (var item in group['data']) {
        var article = parseArticle(item, 0);
        if (article.type != ArticleType.zhihu) {
          res.add(article);
        }
      }
    }

    return res;
  }
}
