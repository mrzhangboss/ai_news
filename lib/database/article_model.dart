import 'package:ai_news/database/constant.dart';
import 'package:isar/isar.dart';

part 'article_model.g.dart';

@collection
class Article {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(unique: true, replace: true)
  late String url;
  @enumerated
  late ArticleType type;
  @enumerated
  ArticleStatus status = ArticleStatus.unread;

  late String title;
  String? hot;
  late int rank;
  int readTimes = 0;
  DateTime createAt = DateTime.now();
  DateTime updateAt = DateTime.now();

  late ArticleContent content;
  ArticleCategory? category;
  bool hadTagged = false;

}

@embedded
class ArticleContent {
  String? description;
  String? content;
  String? backgroundIcon;
  String? authorAvatar;
  String? author;
  String? authorInfo;

  DateTime createAt = DateTime.now();
}

@embedded
class ArticleCategory {
  List<String> categories = [];

  DateTime createAt = DateTime.now();
  DateTime updateAt = DateTime.now();
}

@collection
class ArticleRank {
  Id id = Isar.autoIncrement;
  final article = IsarLink<Article>();

  @enumerated
  late ArticleType type;
  @Index(unique: true, replace: true, composite: [CompositeIndex('type')])
  late int rank;
  String? hot;

  int typeReadTimes = 0;

  DateTime updateAt = DateTime.now();
}

@collection
class Tag {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  late String tagName;
  bool isDeleted = false;
  @enumerated
  OpinionType opinion = OpinionType.neutral;


  DateTime createAt = DateTime.now();
}


