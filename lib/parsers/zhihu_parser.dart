import 'package:ai_news/models/news.dart';

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
  News parseNews(Map<String, dynamic> json, int rank) {
    var questionId = json['target']['id'].toString();
    return News(
      id: questionId,
      rank: rank,
      createAt: DateTime.now(),
      title: json['target']['title'],
      description: json['target']['excerpt'],
      imageUrl:
          json['children'].isNotEmpty ? json['children'][0]['thumbnail'] : null,
      url: convertReadApiUrl(json['target']['id'].toString()),
      author: json['target']['author']['name'],
      hot: json['detail_text'],
      note: json['detail_text'],
      type: NewsType.zhihu,
    );
  }
}
