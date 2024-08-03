import 'package:freezed_annotation/freezed_annotation.dart';

import 'constant.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required NewsType type,
    required String id,
    DateTime? readAt,
    DateTime? updateAt,
    @Default(false) bool isRead,
    bool? isLiked,
    @Default(false) bool isClicked,
    @Default(0) int readTimes,
    String? category,
    int? like,
    int? sort,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}
