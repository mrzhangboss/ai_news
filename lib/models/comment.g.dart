// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      type: $enumDecode(_$NewsTypeEnumMap, json['type']),
      id: json['id'] as String,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isLiked: json['isLiked'] as bool?,
      isClicked: json['isClicked'] as bool? ?? false,
      readTimes: (json['readTimes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'type': _$NewsTypeEnumMap[instance.type]!,
      'id': instance.id,
      'readAt': instance.readAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'isRead': instance.isRead,
      'isLiked': instance.isLiked,
      'isClicked': instance.isClicked,
      'readTimes': instance.readTimes,
    };

const _$NewsTypeEnumMap = {
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
