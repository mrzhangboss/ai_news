// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  NewsType get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get authorAvatar => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get hot => throw _privateConstructorUsedError;
  String get categories => throw _privateConstructorUsedError;
  int? get liked => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  int? get viewed => throw _privateConstructorUsedError;
  int? get collected => throw _privateConstructorUsedError;
  int? get commented => throw _privateConstructorUsedError;
  int? get interacted => throw _privateConstructorUsedError;
  int? get hotRank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {NewsType type,
      String id,
      String title,
      DateTime createAt,
      String description,
      String imageUrl,
      String url,
      String author,
      String authorAvatar,
      String note,
      String hot,
      String categories,
      int? liked,
      int? rank,
      int? viewed,
      int? collected,
      int? commented,
      int? interacted,
      int? hotRank});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? title = null,
    Object? createAt = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? url = null,
    Object? author = null,
    Object? authorAvatar = null,
    Object? note = null,
    Object? hot = null,
    Object? categories = null,
    Object? liked = freezed,
    Object? rank = freezed,
    Object? viewed = freezed,
    Object? collected = freezed,
    Object? commented = freezed,
    Object? interacted = freezed,
    Object? hotRank = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorAvatar: null == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      hot: null == hot
          ? _value.hot
          : hot // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      viewed: freezed == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int?,
      collected: freezed == collected
          ? _value.collected
          : collected // ignore: cast_nullable_to_non_nullable
              as int?,
      commented: freezed == commented
          ? _value.commented
          : commented // ignore: cast_nullable_to_non_nullable
              as int?,
      interacted: freezed == interacted
          ? _value.interacted
          : interacted // ignore: cast_nullable_to_non_nullable
              as int?,
      hotRank: freezed == hotRank
          ? _value.hotRank
          : hotRank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NewsType type,
      String id,
      String title,
      DateTime createAt,
      String description,
      String imageUrl,
      String url,
      String author,
      String authorAvatar,
      String note,
      String hot,
      String categories,
      int? liked,
      int? rank,
      int? viewed,
      int? collected,
      int? commented,
      int? interacted,
      int? hotRank});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? title = null,
    Object? createAt = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? url = null,
    Object? author = null,
    Object? authorAvatar = null,
    Object? note = null,
    Object? hot = null,
    Object? categories = null,
    Object? liked = freezed,
    Object? rank = freezed,
    Object? viewed = freezed,
    Object? collected = freezed,
    Object? commented = freezed,
    Object? interacted = freezed,
    Object? hotRank = freezed,
  }) {
    return _then(_$NewsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorAvatar: null == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      hot: null == hot
          ? _value.hot
          : hot // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      viewed: freezed == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int?,
      collected: freezed == collected
          ? _value.collected
          : collected // ignore: cast_nullable_to_non_nullable
              as int?,
      commented: freezed == commented
          ? _value.commented
          : commented // ignore: cast_nullable_to_non_nullable
              as int?,
      interacted: freezed == interacted
          ? _value.interacted
          : interacted // ignore: cast_nullable_to_non_nullable
              as int?,
      hotRank: freezed == hotRank
          ? _value.hotRank
          : hotRank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  const _$NewsImpl(
      {required this.type,
      required this.id,
      required this.title,
      required this.createAt,
      this.description = '',
      this.imageUrl = '',
      required this.url,
      this.author = '',
      this.authorAvatar = '',
      this.note = '',
      this.hot = '',
      this.categories = '',
      this.liked,
      this.rank,
      this.viewed,
      this.collected,
      this.commented,
      this.interacted,
      this.hotRank});

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final NewsType type;
  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime createAt;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  final String url;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final String authorAvatar;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final String hot;
  @override
  @JsonKey()
  final String categories;
  @override
  final int? liked;
  @override
  final int? rank;
  @override
  final int? viewed;
  @override
  final int? collected;
  @override
  final int? commented;
  @override
  final int? interacted;
  @override
  final int? hotRank;

  @override
  String toString() {
    return 'News(type: $type, id: $id, title: $title, createAt: $createAt, description: $description, imageUrl: $imageUrl, url: $url, author: $author, authorAvatar: $authorAvatar, note: $note, hot: $hot, categories: $categories, liked: $liked, rank: $rank, viewed: $viewed, collected: $collected, commented: $commented, interacted: $interacted, hotRank: $hotRank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.hot, hot) || other.hot == hot) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.collected, collected) ||
                other.collected == collected) &&
            (identical(other.commented, commented) ||
                other.commented == commented) &&
            (identical(other.interacted, interacted) ||
                other.interacted == interacted) &&
            (identical(other.hotRank, hotRank) || other.hotRank == hotRank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        id,
        title,
        createAt,
        description,
        imageUrl,
        url,
        author,
        authorAvatar,
        note,
        hot,
        categories,
        liked,
        rank,
        viewed,
        collected,
        commented,
        interacted,
        hotRank
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  const factory _News(
      {required final NewsType type,
      required final String id,
      required final String title,
      required final DateTime createAt,
      final String description,
      final String imageUrl,
      required final String url,
      final String author,
      final String authorAvatar,
      final String note,
      final String hot,
      final String categories,
      final int? liked,
      final int? rank,
      final int? viewed,
      final int? collected,
      final int? commented,
      final int? interacted,
      final int? hotRank}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  NewsType get type;
  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get createAt;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get url;
  @override
  String get author;
  @override
  String get authorAvatar;
  @override
  String get note;
  @override
  String get hot;
  @override
  String get categories;
  @override
  int? get liked;
  @override
  int? get rank;
  @override
  int? get viewed;
  @override
  int? get collected;
  @override
  int? get commented;
  @override
  int? get interacted;
  @override
  int? get hotRank;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
