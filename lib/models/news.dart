class News {
  final String title;
  final String description;
  final String? imageUrl;
  final String url;
  final String author;
  final String? trade;
  final int createAt;

  const News({
    required this.title,
    required this.createAt,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.author,
    required this.trade,
  });
}

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
      required super.trade,
      required super.imageUrl,
      required super.url,
      required super.author,
      required this.hot});

  static String convertReadApiUrl(String questionId) {
    return 'https://zhihu.com/question/$questionId';
  }

  factory ZhiHuNews.fromJson(Map<String, dynamic> json, int rank) {
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
      trade: json['detail_text'],
    );
  }
}
