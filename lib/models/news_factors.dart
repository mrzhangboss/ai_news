import 'juejin_news.dart';
import 'news.dart';
import 'toutiao_news.dart';
import 'zhihu_news.dart';

class NewsFactors {
  static News buildNews(Map<String, dynamic> json, int rank, NewsType type) {
    switch (type) {
      case NewsType.zhihu:
        return ZhiHuNews.parseApiJson(json, rank);
      case NewsType.toutiao:
        return ToutiaoNews.parseApiJson(json);
      case NewsType.juejin:
        return JuejinNews.parseApiJson(json, rank);
      default:
        return ZhiHuNews.parseApiJson(json, rank);
    }
  }
}
