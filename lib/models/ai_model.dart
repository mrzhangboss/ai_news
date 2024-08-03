import 'constant.dart';

class AiModel {
  final NewsType type;
  final String id;
  final String title;
  final String description;
  String? category;
  int? like;
  int? sort;

  AiModel(
      {required this.type,
      required this.id,
      required this.title,
      required this.description,
      this.category,
      this.like,
      this.sort});
}
