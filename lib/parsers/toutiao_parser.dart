import 'package:ai_news/models/news.dart';

import '../models/constant.dart';
import 'base_parser.dart';

class ToutiaoParser extends BaseParser {
  @override
  String getDownloadUrl() {
    return 'https://api.vvhan.com/api/hotlist/toutiao';
  }

  @override
  News parseNews(Map<String, dynamic> json, int rank) {
    Uri uri = Uri.parse(json['url']);
    String topicId = uri.queryParameters['topic_id'] ?? '';
    return News(
      id: topicId,
      rank: json['index'],
      createAt: DateTime.now(),
      title: json['title'],
      description: '',
      imageUrl: '',
      url: json['mobil_url'],
      author: '',
      hot: json['hot'],
      note: json['hot'],
      type: NewsType.toutiao,
    );
  }
}
