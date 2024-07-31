import 'package:freezed_annotation/freezed_annotation.dart';

import 'constant.dart';

part 'news.freezed.dart';

part 'news.g.dart';


@freezed
class News with _$News {
  const factory News({
    required NewsType type,
    required String id,
    required String title,
    required DateTime createAt,
    @Default('') String description,
    @Default('') String imageUrl,
    required String url,
    @Default('') String author,
    @Default('') String authorAvatar,
    @Default('') String note,
    @Default('') String hot,
    @Default('') String categories,
    int? liked,
    int? rank,
    int? viewed,
    int? collected,
    int? commented,
    int? interacted,
    int? hotRank,
  }) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
