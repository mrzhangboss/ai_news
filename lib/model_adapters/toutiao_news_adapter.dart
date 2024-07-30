import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/toutiao_news.dart';
import '../models/zhihu_news.dart';

class ToutiaoAdapter extends TypeAdapter<ToutiaoNews> {
  @override
  final typeId = 2;

  @override
  ToutiaoNews read(BinaryReader reader) {
    return ToutiaoNews.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, ToutiaoNews obj) {
    writer.write(jsonEncode(obj));
  }
}
