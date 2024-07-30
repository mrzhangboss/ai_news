import 'news.dart';

class JuejinNews extends News {
  final String id;
  final String hot;
  final int rank;

  const JuejinNews(
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

  factory JuejinNews.fromJson(Map<String, dynamic> json) {
    return JuejinNews(
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
        type: NewsType.juejin);
  }

  static JuejinNews parseApiJson(Map<String, dynamic> json, int rank) {
    var id = json['content']['content_id'];
    var like = json['content_counter']['like'];
    var note = '${like}人喜欢';
    return JuejinNews(
      id: id,
      rank: rank,
      createAt: DateTime.now().millisecondsSinceEpoch,
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
