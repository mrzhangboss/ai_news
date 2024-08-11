// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetArticleCollection on Isar {
  IsarCollection<Article> get articles => this.collection();
}

const ArticleSchema = CollectionSchema(
  name: r'Article',
  id: 9049022761614856892,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.object,
      target: r'ArticleCategory',
    ),
    r'content': PropertySchema(
      id: 1,
      name: r'content',
      type: IsarType.object,
      target: r'ArticleContent',
    ),
    r'createAt': PropertySchema(
      id: 2,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'hadTagged': PropertySchema(
      id: 3,
      name: r'hadTagged',
      type: IsarType.bool,
    ),
    r'hot': PropertySchema(
      id: 4,
      name: r'hot',
      type: IsarType.string,
    ),
    r'rank': PropertySchema(
      id: 5,
      name: r'rank',
      type: IsarType.long,
    ),
    r'readTimes': PropertySchema(
      id: 6,
      name: r'readTimes',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ArticlestatusEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ArticletypeEnumValueMap,
    ),
    r'updateAt': PropertySchema(
      id: 10,
      name: r'updateAt',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(
      id: 11,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _articleEstimateSize,
  serialize: _articleSerialize,
  deserialize: _articleDeserialize,
  deserializeProp: _articleDeserializeProp,
  idName: r'id',
  indexes: {
    r'url': IndexSchema(
      id: -5756857009679432345,
      name: r'url',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'url',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'ArticleContent': ArticleContentSchema,
    r'ArticleCategory': ArticleCategorySchema
  },
  getId: _articleGetId,
  getLinks: _articleGetLinks,
  attach: _articleAttach,
  version: '3.1.0+1',
);

int _articleEstimateSize(
  Article object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 +
          ArticleCategorySchema.estimateSize(
              value, allOffsets[ArticleCategory]!, allOffsets);
    }
  }
  bytesCount += 3 +
      ArticleContentSchema.estimateSize(
          object.content, allOffsets[ArticleContent]!, allOffsets);
  {
    final value = object.hot;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _articleSerialize(
  Article object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ArticleCategory>(
    offsets[0],
    allOffsets,
    ArticleCategorySchema.serialize,
    object.category,
  );
  writer.writeObject<ArticleContent>(
    offsets[1],
    allOffsets,
    ArticleContentSchema.serialize,
    object.content,
  );
  writer.writeDateTime(offsets[2], object.createAt);
  writer.writeBool(offsets[3], object.hadTagged);
  writer.writeString(offsets[4], object.hot);
  writer.writeLong(offsets[5], object.rank);
  writer.writeLong(offsets[6], object.readTimes);
  writer.writeByte(offsets[7], object.status.index);
  writer.writeString(offsets[8], object.title);
  writer.writeByte(offsets[9], object.type.index);
  writer.writeDateTime(offsets[10], object.updateAt);
  writer.writeString(offsets[11], object.url);
}

Article _articleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Article();
  object.category = reader.readObjectOrNull<ArticleCategory>(
    offsets[0],
    ArticleCategorySchema.deserialize,
    allOffsets,
  );
  object.content = reader.readObjectOrNull<ArticleContent>(
        offsets[1],
        ArticleContentSchema.deserialize,
        allOffsets,
      ) ??
      ArticleContent();
  object.createAt = reader.readDateTime(offsets[2]);
  object.hadTagged = reader.readBool(offsets[3]);
  object.hot = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.rank = reader.readLong(offsets[5]);
  object.readTimes = reader.readLong(offsets[6]);
  object.status =
      _ArticlestatusValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          ArticleStatus.unread;
  object.title = reader.readString(offsets[8]);
  object.type = _ArticletypeValueEnumMap[reader.readByteOrNull(offsets[9])] ??
      ArticleType.all;
  object.updateAt = reader.readDateTime(offsets[10]);
  object.url = reader.readString(offsets[11]);
  return object;
}

P _articleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ArticleCategory>(
        offset,
        ArticleCategorySchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<ArticleContent>(
            offset,
            ArticleContentSchema.deserialize,
            allOffsets,
          ) ??
          ArticleContent()) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (_ArticlestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          ArticleStatus.unread) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_ArticletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ArticleType.all) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ArticlestatusEnumValueMap = {
  'unread': 0,
  'read': 1,
  'clicked': 2,
  'like': 3,
  'dislike': 4,
};
const _ArticlestatusValueEnumMap = {
  0: ArticleStatus.unread,
  1: ArticleStatus.read,
  2: ArticleStatus.clicked,
  3: ArticleStatus.like,
  4: ArticleStatus.dislike,
};
const _ArticletypeEnumValueMap = {
  'all': 0,
  'like': 1,
  'dislike': 2,
  'zhihu': 3,
  'juejin': 4,
  'weibo': 5,
  'toutiao': 6,
  'huPu': 7,
  'zhihuDay': 8,
  'three6Ke': 9,
  'bilibili': 10,
  'baiduRD': 11,
  'douyinHot': 12,
  'douban': 13,
  'huXiu': 14,
  'woShiPm': 15,
};
const _ArticletypeValueEnumMap = {
  0: ArticleType.all,
  1: ArticleType.like,
  2: ArticleType.dislike,
  3: ArticleType.zhihu,
  4: ArticleType.juejin,
  5: ArticleType.weibo,
  6: ArticleType.toutiao,
  7: ArticleType.huPu,
  8: ArticleType.zhihuDay,
  9: ArticleType.three6Ke,
  10: ArticleType.bilibili,
  11: ArticleType.baiduRD,
  12: ArticleType.douyinHot,
  13: ArticleType.douban,
  14: ArticleType.huXiu,
  15: ArticleType.woShiPm,
};

Id _articleGetId(Article object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _articleGetLinks(Article object) {
  return [];
}

void _articleAttach(IsarCollection<dynamic> col, Id id, Article object) {
  object.id = id;
}

extension ArticleByIndex on IsarCollection<Article> {
  Future<Article?> getByUrl(String url) {
    return getByIndex(r'url', [url]);
  }

  Article? getByUrlSync(String url) {
    return getByIndexSync(r'url', [url]);
  }

  Future<bool> deleteByUrl(String url) {
    return deleteByIndex(r'url', [url]);
  }

  bool deleteByUrlSync(String url) {
    return deleteByIndexSync(r'url', [url]);
  }

  Future<List<Article?>> getAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndex(r'url', values);
  }

  List<Article?> getAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'url', values);
  }

  Future<int> deleteAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'url', values);
  }

  int deleteAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'url', values);
  }

  Future<Id> putByUrl(Article object) {
    return putByIndex(r'url', object);
  }

  Id putByUrlSync(Article object, {bool saveLinks = true}) {
    return putByIndexSync(r'url', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUrl(List<Article> objects) {
    return putAllByIndex(r'url', objects);
  }

  List<Id> putAllByUrlSync(List<Article> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'url', objects, saveLinks: saveLinks);
  }
}

extension ArticleQueryWhereSort on QueryBuilder<Article, Article, QWhere> {
  QueryBuilder<Article, Article, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ArticleQueryWhere on QueryBuilder<Article, Article, QWhereClause> {
  QueryBuilder<Article, Article, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> urlEqualTo(String url) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'url',
        value: [url],
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> urlNotEqualTo(String url) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ArticleQueryFilter
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hadTaggedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadTagged',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hot',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hot',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hot',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hot',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hot',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> rankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> rankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> readTimesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> readTimesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> readTimesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> readTimesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> statusEqualTo(
      ArticleStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> statusGreaterThan(
    ArticleStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> statusLessThan(
    ArticleStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> statusBetween(
    ArticleStatus lower,
    ArticleStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> typeEqualTo(
      ArticleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> typeGreaterThan(
    ArticleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> typeLessThan(
    ArticleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> typeBetween(
    ArticleType lower,
    ArticleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updateAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updateAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updateAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updateAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension ArticleQueryObject
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> category(
      FilterQuery<ArticleCategory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'category');
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> content(
      FilterQuery<ArticleContent> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'content');
    });
  }
}

extension ArticleQueryLinks
    on QueryBuilder<Article, Article, QFilterCondition> {}

extension ArticleQuerySortBy on QueryBuilder<Article, Article, QSortBy> {
  QueryBuilder<Article, Article, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHadTagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadTagged', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHadTaggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadTagged', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readTimes', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByReadTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readTimes', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ArticleQuerySortThenBy
    on QueryBuilder<Article, Article, QSortThenBy> {
  QueryBuilder<Article, Article, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHadTagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadTagged', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHadTaggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadTagged', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readTimes', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByReadTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readTimes', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ArticleQueryWhereDistinct
    on QueryBuilder<Article, Article, QDistinct> {
  QueryBuilder<Article, Article, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByHadTagged() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadTagged');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByHot(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readTimes');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateAt');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension ArticleQueryProperty
    on QueryBuilder<Article, Article, QQueryProperty> {
  QueryBuilder<Article, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Article, ArticleCategory?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Article, ArticleContent, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<Article, DateTime, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Article, bool, QQueryOperations> hadTaggedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadTagged');
    });
  }

  QueryBuilder<Article, String?, QQueryOperations> hotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hot');
    });
  }

  QueryBuilder<Article, int, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<Article, int, QQueryOperations> readTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readTimes');
    });
  }

  QueryBuilder<Article, ArticleStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Article, ArticleType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Article, DateTime, QQueryOperations> updateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateAt');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetArticleRankCollection on Isar {
  IsarCollection<ArticleRank> get articleRanks => this.collection();
}

const ArticleRankSchema = CollectionSchema(
  name: r'ArticleRank',
  id: 9199998871070321900,
  properties: {
    r'hot': PropertySchema(
      id: 0,
      name: r'hot',
      type: IsarType.string,
    ),
    r'rank': PropertySchema(
      id: 1,
      name: r'rank',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ArticleRanktypeEnumValueMap,
    ),
    r'typeReadTimes': PropertySchema(
      id: 3,
      name: r'typeReadTimes',
      type: IsarType.long,
    ),
    r'updateAt': PropertySchema(
      id: 4,
      name: r'updateAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _articleRankEstimateSize,
  serialize: _articleRankSerialize,
  deserialize: _articleRankDeserialize,
  deserializeProp: _articleRankDeserializeProp,
  idName: r'id',
  indexes: {
    r'rank_type': IndexSchema(
      id: -8456482025753925637,
      name: r'rank_type',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'rank',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'type',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'article': LinkSchema(
      id: 3551462005961771753,
      name: r'article',
      target: r'Article',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _articleRankGetId,
  getLinks: _articleRankGetLinks,
  attach: _articleRankAttach,
  version: '3.1.0+1',
);

int _articleRankEstimateSize(
  ArticleRank object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hot;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _articleRankSerialize(
  ArticleRank object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hot);
  writer.writeLong(offsets[1], object.rank);
  writer.writeByte(offsets[2], object.type.index);
  writer.writeLong(offsets[3], object.typeReadTimes);
  writer.writeDateTime(offsets[4], object.updateAt);
}

ArticleRank _articleRankDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ArticleRank();
  object.hot = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.rank = reader.readLong(offsets[1]);
  object.type =
      _ArticleRanktypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          ArticleType.all;
  object.typeReadTimes = reader.readLong(offsets[3]);
  object.updateAt = reader.readDateTime(offsets[4]);
  return object;
}

P _articleRankDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_ArticleRanktypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ArticleType.all) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ArticleRanktypeEnumValueMap = {
  'all': 0,
  'like': 1,
  'dislike': 2,
  'zhihu': 3,
  'juejin': 4,
  'weibo': 5,
  'toutiao': 6,
  'huPu': 7,
  'zhihuDay': 8,
  'three6Ke': 9,
  'bilibili': 10,
  'baiduRD': 11,
  'douyinHot': 12,
  'douban': 13,
  'huXiu': 14,
  'woShiPm': 15,
};
const _ArticleRanktypeValueEnumMap = {
  0: ArticleType.all,
  1: ArticleType.like,
  2: ArticleType.dislike,
  3: ArticleType.zhihu,
  4: ArticleType.juejin,
  5: ArticleType.weibo,
  6: ArticleType.toutiao,
  7: ArticleType.huPu,
  8: ArticleType.zhihuDay,
  9: ArticleType.three6Ke,
  10: ArticleType.bilibili,
  11: ArticleType.baiduRD,
  12: ArticleType.douyinHot,
  13: ArticleType.douban,
  14: ArticleType.huXiu,
  15: ArticleType.woShiPm,
};

Id _articleRankGetId(ArticleRank object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _articleRankGetLinks(ArticleRank object) {
  return [object.article];
}

void _articleRankAttach(
    IsarCollection<dynamic> col, Id id, ArticleRank object) {
  object.id = id;
  object.article.attach(col, col.isar.collection<Article>(), r'article', id);
}

extension ArticleRankByIndex on IsarCollection<ArticleRank> {
  Future<ArticleRank?> getByRankType(int rank, ArticleType type) {
    return getByIndex(r'rank_type', [rank, type]);
  }

  ArticleRank? getByRankTypeSync(int rank, ArticleType type) {
    return getByIndexSync(r'rank_type', [rank, type]);
  }

  Future<bool> deleteByRankType(int rank, ArticleType type) {
    return deleteByIndex(r'rank_type', [rank, type]);
  }

  bool deleteByRankTypeSync(int rank, ArticleType type) {
    return deleteByIndexSync(r'rank_type', [rank, type]);
  }

  Future<List<ArticleRank?>> getAllByRankType(
      List<int> rankValues, List<ArticleType> typeValues) {
    final len = rankValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rankValues[i], typeValues[i]]);
    }

    return getAllByIndex(r'rank_type', values);
  }

  List<ArticleRank?> getAllByRankTypeSync(
      List<int> rankValues, List<ArticleType> typeValues) {
    final len = rankValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rankValues[i], typeValues[i]]);
    }

    return getAllByIndexSync(r'rank_type', values);
  }

  Future<int> deleteAllByRankType(
      List<int> rankValues, List<ArticleType> typeValues) {
    final len = rankValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rankValues[i], typeValues[i]]);
    }

    return deleteAllByIndex(r'rank_type', values);
  }

  int deleteAllByRankTypeSync(
      List<int> rankValues, List<ArticleType> typeValues) {
    final len = rankValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rankValues[i], typeValues[i]]);
    }

    return deleteAllByIndexSync(r'rank_type', values);
  }

  Future<Id> putByRankType(ArticleRank object) {
    return putByIndex(r'rank_type', object);
  }

  Id putByRankTypeSync(ArticleRank object, {bool saveLinks = true}) {
    return putByIndexSync(r'rank_type', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRankType(List<ArticleRank> objects) {
    return putAllByIndex(r'rank_type', objects);
  }

  List<Id> putAllByRankTypeSync(List<ArticleRank> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'rank_type', objects, saveLinks: saveLinks);
  }
}

extension ArticleRankQueryWhereSort
    on QueryBuilder<ArticleRank, ArticleRank, QWhere> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhere> anyRankType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'rank_type'),
      );
    });
  }
}

extension ArticleRankQueryWhere
    on QueryBuilder<ArticleRank, ArticleRank, QWhereClause> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> rankEqualToAnyType(
      int rank) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rank_type',
        value: [rank],
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankNotEqualToAnyType(int rank) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [],
              upper: [rank],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [],
              upper: [rank],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankGreaterThanAnyType(
    int rank, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [rank],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> rankLessThanAnyType(
    int rank, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [],
        upper: [rank],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> rankBetweenAnyType(
    int lowerRank,
    int upperRank, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [lowerRank],
        includeLower: includeLower,
        upper: [upperRank],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause> rankTypeEqualTo(
      int rank, ArticleType type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rank_type',
        value: [rank, type],
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankEqualToTypeNotEqualTo(int rank, ArticleType type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank],
              upper: [rank, type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank, type],
              includeLower: false,
              upper: [rank],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank, type],
              includeLower: false,
              upper: [rank],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rank_type',
              lower: [rank],
              upper: [rank, type],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankEqualToTypeGreaterThan(
    int rank,
    ArticleType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [rank, type],
        includeLower: include,
        upper: [rank],
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankEqualToTypeLessThan(
    int rank,
    ArticleType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [rank],
        upper: [rank, type],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterWhereClause>
      rankEqualToTypeBetween(
    int rank,
    ArticleType lowerType,
    ArticleType upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rank_type',
        lower: [rank, lowerType],
        includeLower: includeLower,
        upper: [rank, upperType],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ArticleRankQueryFilter
    on QueryBuilder<ArticleRank, ArticleRank, QFilterCondition> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hot',
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hot',
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hot',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> hotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hot',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      hotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hot',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> rankEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> rankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> typeEqualTo(
      ArticleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> typeGreaterThan(
    ArticleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> typeLessThan(
    ArticleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> typeBetween(
    ArticleType lower,
    ArticleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      typeReadTimesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeReadTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      typeReadTimesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeReadTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      typeReadTimesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeReadTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      typeReadTimesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeReadTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> updateAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      updateAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      updateAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> updateAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ArticleRankQueryObject
    on QueryBuilder<ArticleRank, ArticleRank, QFilterCondition> {}

extension ArticleRankQueryLinks
    on QueryBuilder<ArticleRank, ArticleRank, QFilterCondition> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition> article(
      FilterQuery<Article> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'article');
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterFilterCondition>
      articleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'article', 0, true, 0, true);
    });
  }
}

extension ArticleRankQuerySortBy
    on QueryBuilder<ArticleRank, ArticleRank, QSortBy> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByTypeReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeReadTimes', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy>
      sortByTypeReadTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeReadTimes', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> sortByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }
}

extension ArticleRankQuerySortThenBy
    on QueryBuilder<ArticleRank, ArticleRank, QSortThenBy> {
  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hot', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByTypeReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeReadTimes', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy>
      thenByTypeReadTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeReadTimes', Sort.desc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QAfterSortBy> thenByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }
}

extension ArticleRankQueryWhereDistinct
    on QueryBuilder<ArticleRank, ArticleRank, QDistinct> {
  QueryBuilder<ArticleRank, ArticleRank, QDistinct> distinctByHot(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QDistinct> distinctByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank');
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QDistinct> distinctByTypeReadTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeReadTimes');
    });
  }

  QueryBuilder<ArticleRank, ArticleRank, QDistinct> distinctByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateAt');
    });
  }
}

extension ArticleRankQueryProperty
    on QueryBuilder<ArticleRank, ArticleRank, QQueryProperty> {
  QueryBuilder<ArticleRank, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ArticleRank, String?, QQueryOperations> hotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hot');
    });
  }

  QueryBuilder<ArticleRank, int, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<ArticleRank, ArticleType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ArticleRank, int, QQueryOperations> typeReadTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeReadTimes');
    });
  }

  QueryBuilder<ArticleRank, DateTime, QQueryOperations> updateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTagCollection on Isar {
  IsarCollection<Tag> get tags => this.collection();
}

const TagSchema = CollectionSchema(
  name: r'Tag',
  id: 4007045862261149568,
  properties: {
    r'createAt': PropertySchema(
      id: 0,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 1,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'opinion': PropertySchema(
      id: 2,
      name: r'opinion',
      type: IsarType.byte,
      enumMap: _TagopinionEnumValueMap,
    ),
    r'tagName': PropertySchema(
      id: 3,
      name: r'tagName',
      type: IsarType.string,
    )
  },
  estimateSize: _tagEstimateSize,
  serialize: _tagSerialize,
  deserialize: _tagDeserialize,
  deserializeProp: _tagDeserializeProp,
  idName: r'id',
  indexes: {
    r'tagName': IndexSchema(
      id: -8671726392555702129,
      name: r'tagName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tagName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tagGetId,
  getLinks: _tagGetLinks,
  attach: _tagAttach,
  version: '3.1.0+1',
);

int _tagEstimateSize(
  Tag object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tagName.length * 3;
  return bytesCount;
}

void _tagSerialize(
  Tag object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createAt);
  writer.writeBool(offsets[1], object.isDeleted);
  writer.writeByte(offsets[2], object.opinion.index);
  writer.writeString(offsets[3], object.tagName);
}

Tag _tagDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tag();
  object.createAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[1]);
  object.opinion = _TagopinionValueEnumMap[reader.readByteOrNull(offsets[2])] ??
      OpinionType.neutral;
  object.tagName = reader.readString(offsets[3]);
  return object;
}

P _tagDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (_TagopinionValueEnumMap[reader.readByteOrNull(offset)] ??
          OpinionType.neutral) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TagopinionEnumValueMap = {
  'neutral': 0,
  'like': 1,
  'dislike': 2,
};
const _TagopinionValueEnumMap = {
  0: OpinionType.neutral,
  1: OpinionType.like,
  2: OpinionType.dislike,
};

Id _tagGetId(Tag object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tagGetLinks(Tag object) {
  return [];
}

void _tagAttach(IsarCollection<dynamic> col, Id id, Tag object) {
  object.id = id;
}

extension TagByIndex on IsarCollection<Tag> {
  Future<Tag?> getByTagName(String tagName) {
    return getByIndex(r'tagName', [tagName]);
  }

  Tag? getByTagNameSync(String tagName) {
    return getByIndexSync(r'tagName', [tagName]);
  }

  Future<bool> deleteByTagName(String tagName) {
    return deleteByIndex(r'tagName', [tagName]);
  }

  bool deleteByTagNameSync(String tagName) {
    return deleteByIndexSync(r'tagName', [tagName]);
  }

  Future<List<Tag?>> getAllByTagName(List<String> tagNameValues) {
    final values = tagNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'tagName', values);
  }

  List<Tag?> getAllByTagNameSync(List<String> tagNameValues) {
    final values = tagNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tagName', values);
  }

  Future<int> deleteAllByTagName(List<String> tagNameValues) {
    final values = tagNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tagName', values);
  }

  int deleteAllByTagNameSync(List<String> tagNameValues) {
    final values = tagNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tagName', values);
  }

  Future<Id> putByTagName(Tag object) {
    return putByIndex(r'tagName', object);
  }

  Id putByTagNameSync(Tag object, {bool saveLinks = true}) {
    return putByIndexSync(r'tagName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTagName(List<Tag> objects) {
    return putAllByIndex(r'tagName', objects);
  }

  List<Id> putAllByTagNameSync(List<Tag> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'tagName', objects, saveLinks: saveLinks);
  }
}

extension TagQueryWhereSort on QueryBuilder<Tag, Tag, QWhere> {
  QueryBuilder<Tag, Tag, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TagQueryWhere on QueryBuilder<Tag, Tag, QWhereClause> {
  QueryBuilder<Tag, Tag, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> tagNameEqualTo(String tagName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tagName',
        value: [tagName],
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> tagNameNotEqualTo(String tagName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagName',
              lower: [],
              upper: [tagName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagName',
              lower: [tagName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagName',
              lower: [tagName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagName',
              lower: [],
              upper: [tagName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TagQueryFilter on QueryBuilder<Tag, Tag, QFilterCondition> {
  QueryBuilder<Tag, Tag, QAfterFilterCondition> createAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> opinionEqualTo(
      OpinionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opinion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> opinionGreaterThan(
    OpinionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opinion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> opinionLessThan(
    OpinionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opinion',
        value: value,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> opinionBetween(
    OpinionType lower,
    OpinionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opinion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagName',
        value: '',
      ));
    });
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagName',
        value: '',
      ));
    });
  }
}

extension TagQueryObject on QueryBuilder<Tag, Tag, QFilterCondition> {}

extension TagQueryLinks on QueryBuilder<Tag, Tag, QFilterCondition> {}

extension TagQuerySortBy on QueryBuilder<Tag, Tag, QSortBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByOpinion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opinion', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByOpinionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opinion', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTagName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTagNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.desc);
    });
  }
}

extension TagQuerySortThenBy on QueryBuilder<Tag, Tag, QSortThenBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByOpinion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opinion', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByOpinionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opinion', Sort.desc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTagName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.asc);
    });
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTagNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.desc);
    });
  }
}

extension TagQueryWhereDistinct on QueryBuilder<Tag, Tag, QDistinct> {
  QueryBuilder<Tag, Tag, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByOpinion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opinion');
    });
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByTagName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagName', caseSensitive: caseSensitive);
    });
  }
}

extension TagQueryProperty on QueryBuilder<Tag, Tag, QQueryProperty> {
  QueryBuilder<Tag, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Tag, DateTime, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Tag, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<Tag, OpinionType, QQueryOperations> opinionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opinion');
    });
  }

  QueryBuilder<Tag, String, QQueryOperations> tagNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagName');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ArticleContentSchema = Schema(
  name: r'ArticleContent',
  id: 841872022348942689,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.string,
    ),
    r'authorAvatar': PropertySchema(
      id: 1,
      name: r'authorAvatar',
      type: IsarType.string,
    ),
    r'authorInfo': PropertySchema(
      id: 2,
      name: r'authorInfo',
      type: IsarType.string,
    ),
    r'backgroundIcon': PropertySchema(
      id: 3,
      name: r'backgroundIcon',
      type: IsarType.string,
    ),
    r'content': PropertySchema(
      id: 4,
      name: r'content',
      type: IsarType.string,
    ),
    r'createAt': PropertySchema(
      id: 5,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 6,
      name: r'description',
      type: IsarType.string,
    )
  },
  estimateSize: _articleContentEstimateSize,
  serialize: _articleContentSerialize,
  deserialize: _articleContentDeserialize,
  deserializeProp: _articleContentDeserializeProp,
);

int _articleContentEstimateSize(
  ArticleContent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.author;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorAvatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorInfo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backgroundIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _articleContentSerialize(
  ArticleContent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.author);
  writer.writeString(offsets[1], object.authorAvatar);
  writer.writeString(offsets[2], object.authorInfo);
  writer.writeString(offsets[3], object.backgroundIcon);
  writer.writeString(offsets[4], object.content);
  writer.writeDateTime(offsets[5], object.createAt);
  writer.writeString(offsets[6], object.description);
}

ArticleContent _articleContentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ArticleContent();
  object.author = reader.readStringOrNull(offsets[0]);
  object.authorAvatar = reader.readStringOrNull(offsets[1]);
  object.authorInfo = reader.readStringOrNull(offsets[2]);
  object.backgroundIcon = reader.readStringOrNull(offsets[3]);
  object.content = reader.readStringOrNull(offsets[4]);
  object.createAt = reader.readDateTime(offsets[5]);
  object.description = reader.readStringOrNull(offsets[6]);
  return object;
}

P _articleContentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ArticleContentQueryFilter
    on QueryBuilder<ArticleContent, ArticleContent, QFilterCondition> {
  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorAvatar',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorAvatar',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorAvatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorAvatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorAvatar',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorAvatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorAvatar',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorInfo',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorInfo',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      authorInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backgroundIcon',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backgroundIcon',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backgroundIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backgroundIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backgroundIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backgroundIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      backgroundIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backgroundIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      createAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleContent, ArticleContent, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }
}

extension ArticleContentQueryObject
    on QueryBuilder<ArticleContent, ArticleContent, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ArticleCategorySchema = Schema(
  name: r'ArticleCategory',
  id: -2504884527719516749,
  properties: {
    r'categories': PropertySchema(
      id: 0,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'createAt': PropertySchema(
      id: 1,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'updateAt': PropertySchema(
      id: 2,
      name: r'updateAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _articleCategoryEstimateSize,
  serialize: _articleCategorySerialize,
  deserialize: _articleCategoryDeserialize,
  deserializeProp: _articleCategoryDeserializeProp,
);

int _articleCategoryEstimateSize(
  ArticleCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _articleCategorySerialize(
  ArticleCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.categories);
  writer.writeDateTime(offsets[1], object.createAt);
  writer.writeDateTime(offsets[2], object.updateAt);
}

ArticleCategory _articleCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ArticleCategory();
  object.categories = reader.readStringList(offsets[0]) ?? [];
  object.createAt = reader.readDateTime(offsets[1]);
  object.updateAt = reader.readDateTime(offsets[2]);
  return object;
}

P _articleCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ArticleCategoryQueryFilter
    on QueryBuilder<ArticleCategory, ArticleCategory, QFilterCondition> {
  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      createAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      updateAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      updateAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      updateAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticleCategory, ArticleCategory, QAfterFilterCondition>
      updateAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ArticleCategoryQueryObject
    on QueryBuilder<ArticleCategory, ArticleCategory, QFilterCondition> {}
