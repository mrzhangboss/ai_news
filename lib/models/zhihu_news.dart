import 'news.dart';

class ZhiHuNews extends News {
  final String id;
  final String hot;
  final int rank;

  const ZhiHuNews(
      {required super.createAt,
      required this.id,
      required this.rank,
      required super.title,
      required super.description,
      required super.note,
      required super.imageUrl,
      required super.url,
      required super.author,
      required this.hot,
      required super.type});

  static String convertReadApiUrl(String questionId) {
    return 'https://zhihu.com/question/$questionId';
  }

  factory ZhiHuNews.fromJson(Map<String, dynamic> json) {
    return ZhiHuNews(
        createAt: json['createAt'],
        id: json['id'],
        rank: json['rank'],
        title: json['title'],
        description: json['description'],
        note: json['note'],
        imageUrl: json['imageUrl'],
        url: json['url'],
        author: json['author'],
        hot: json['hot'],
        type: NewsType.zhihu);
  }

  static ZhiHuNews parseApiJson(Map<String, dynamic> json, int rank) {
    var questionId = json['target']['id'].toString();
    return ZhiHuNews(
      id: questionId,
      rank: rank,
      createAt: DateTime.now().millisecondsSinceEpoch,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rank': rank,
      'createAt': createAt,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'url': url,
      'author': author,
      'hot': hot,
      'note': note,
      'type': type.toString(),
    };
  }
}
