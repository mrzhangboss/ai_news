import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/zhihu_news.dart';

class ZhiHuNewsAdapter extends TypeAdapter<ZhiHuNews> {
  @override
  final typeId = 1;

  @override
  ZhiHuNews read(BinaryReader reader) {
    return ZhiHuNews.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, ZhiHuNews obj) {
    writer.write(jsonEncode(obj));
  }
}
