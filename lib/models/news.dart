class News {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String author;
  final String hot;

  const News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.author,
    required this.hot,
  });

  static String convertZhihuApiUrl(String url) {
    final regExp = RegExp(r'https:\/\/api\.zhihu\.com\/questions\/(\d+)');
    final match = regExp.firstMatch(url);

    if (match != null && match.groupCount == 1) {
      final questionId = match.group(1);
      return 'https://zhihu.com/question/$questionId';
    }

    // 如果匹配不成功，返回原始 URL
    return url;
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['target']['title'],
        description: json['target']['excerpt'],
        imageUrl:
            json['children'].isNotEmpty ? json['children'][0]['thumbnail'] : '',
        url: convertZhihuApiUrl(json['target']['url']),
        author: json['target']['author']['name'],
        hot: json['detail_text']);
  }
}
