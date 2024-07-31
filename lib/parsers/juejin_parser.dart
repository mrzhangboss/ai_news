import 'package:ai_news/models/news.dart';

import '../models/constant.dart';
import 'base_parser.dart';

class JuejinParser extends BaseParser {
  @override
  String getDownloadUrl() {
    return 'https://api.juejin.cn/content_api/v1/content/article_rank?category_id=1&type=hot';
  }

  @override
  News parseNews(Map<String, dynamic> json, int rank) {
    var id = json['content']['content_id'];
    var like = json['content_counter']['like'];
    var note = '${like}人喜欢';
    return News(
      id: id,
      rank: rank,
      createAt: DateTime.now(),
      title: json['content']['title'],
      description: '',
      imageUrl: json['author'] != null ? json['author']['avatar'] : '',
      url: 'https://juejin.cn/post/$id',
      author: json['author'] != null ? json['author']['name'] : '',
      hot: note,
      note: note,
      type: NewsType.juejin,
    );
  }
  
}