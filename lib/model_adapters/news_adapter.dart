import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/news.dart';


class NewsAdapter extends TypeAdapter<News> {
  @override
  final typeId = 1;

  @override
  News read(BinaryReader reader) {
    return News.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer.write(jsonEncode(obj));
  }
}
