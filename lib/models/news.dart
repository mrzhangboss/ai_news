enum NewsType {
  zhihu,
  juejin,
  weibo,
  toutiao,
  douyin,
  bilibili,
  twitter,
  facebook,
  instagram,
  youtube,
  tiktok,
  reddit,
  pinterest,
  linkedin,
  medium,
  quora,
  tumblr,
  vine,
  vimeo,
  flickr,
  imgur,
  deviantart,
  behance,
  pixiv,
  artstation,
}

class News {
  final NewsType type;
  final String title;
  final String description;
  final String? imageUrl;
  final String url;
  final String author;
  final String? note;
  final int createAt;

  const News({
    required this.type,
    required this.title,
    required this.createAt,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.author,
    required this.note,
  });
}

