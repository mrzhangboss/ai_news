import 'news.dart';

class ToutiaoNews extends News {
  final String id;
  final String hot;
  final int rank;

  const ToutiaoNews(
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



  factory ToutiaoNews.fromJson(Map<String, dynamic> json) {
    return ToutiaoNews(
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
        type: NewsType.toutiao);
  }

  static ToutiaoNews parseApiJson(Map<String, dynamic> json) {
    Uri uri = Uri.parse(json['url']);
    String topicId = uri.queryParameters['topic_id'] ?? '';
    return ToutiaoNews(
      id: topicId,
      rank: json['index'],
      createAt: DateTime.now().millisecondsSinceEpoch,
      title: json['title'],
      description: '',
      imageUrl: '',
      url: json['mobilUrl'],
      author: '',
      hot: json['hot'],
      note: json['hot'],
      type: NewsType.toutiao,
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
