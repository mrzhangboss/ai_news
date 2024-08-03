// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      type: $enumDecode(_$NewsTypeEnumMap, json['type']),
      id: json['id'] as String,
      title: json['title'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      url: json['url'] as String,
      author: json['author'] as String? ?? '',
      authorAvatar: json['authorAvatar'] as String? ?? '',
      note: json['note'] as String? ?? '',
      hot: json['hot'] as String? ?? '',
      categories: json['categories'] as String? ?? '',
      liked: (json['liked'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      viewed: (json['viewed'] as num?)?.toInt(),
      collected: (json['collected'] as num?)?.toInt(),
      commented: (json['commented'] as num?)?.toInt(),
      interacted: (json['interacted'] as num?)?.toInt(),
      hotRank: (json['hotRank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'type': _$NewsTypeEnumMap[instance.type]!,
      'id': instance.id,
      'title': instance.title,
      'createAt': instance.createAt.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'author': instance.author,
      'authorAvatar': instance.authorAvatar,
      'note': instance.note,
      'hot': instance.hot,
      'categories': instance.categories,
      'liked': instance.liked,
      'rank': instance.rank,
      'viewed': instance.viewed,
      'collected': instance.collected,
      'commented': instance.commented,
      'interacted': instance.interacted,
      'hotRank': instance.hotRank,
    };

const _$NewsTypeEnumMap = {
  NewsType.recommend: 'recommend',
  NewsType.zhihu: 'zhihu',
  NewsType.juejin: 'juejin',
  NewsType.weibo: 'weibo',
  NewsType.toutiao: 'toutiao',
  NewsType.douyin: 'douyin',
  NewsType.bilibili: 'bilibili',
  NewsType.twitter: 'twitter',
  NewsType.facebook: 'facebook',
  NewsType.instagram: 'instagram',
  NewsType.youtube: 'youtube',
  NewsType.tiktok: 'tiktok',
  NewsType.reddit: 'reddit',
  NewsType.pinterest: 'pinterest',
  NewsType.linkedin: 'linkedin',
  NewsType.medium: 'medium',
  NewsType.quora: 'quora',
  NewsType.tumblr: 'tumblr',
  NewsType.vine: 'vine',
  NewsType.vimeo: 'vimeo',
  NewsType.flickr: 'flickr',
  NewsType.imgur: 'imgur',
  NewsType.deviantart: 'deviantart',
  NewsType.behance: 'behance',
  NewsType.pixiv: 'pixiv',
  NewsType.artstation: 'artstation',
};
