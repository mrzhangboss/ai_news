import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/juejin_news.dart';
import '../models/toutiao_news.dart';
import '../models/zhihu_news.dart';

class JuejinAdapter extends TypeAdapter<JuejinNews> {
  @override
  final typeId = 3;

  @override
  JuejinNews read(BinaryReader reader) {
    return JuejinNews.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, JuejinNews obj) {
    writer.write(jsonEncode(obj));
  }
}
