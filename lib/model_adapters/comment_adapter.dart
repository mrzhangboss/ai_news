import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/comment.dart';


class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final typeId = 2;

  @override
  Comment read(BinaryReader reader) {
    return Comment.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer.write(jsonEncode(obj));
  }
}
