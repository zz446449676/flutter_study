// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      user: json['user'] == null
          ? null
          : PostUser.fromJson(json['user'] as Map<String, dynamic>),
      totalComments: json['totalComments'] as int?,
      file: json['file'] == null
          ? null
          : PostFile.fromJson(json['file'] as Map<String, dynamic>),
      liked: json['liked'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => PostTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalLikes: json['totalLikes'] as int?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'user': instance.user?.toJson(),
      'totalComments': instance.totalComments,
      'file': instance.file?.toJson(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'totalLikes': instance.totalLikes,
      'liked': instance.liked,
    };

PostUser _$PostUserFromJson(Map<String, dynamic> json) => PostUser(
      id: json['id'] as int?,
      avatar: json['avatar'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PostUserToJson(PostUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

PostFile _$PostFileFromJson(Map<String, dynamic> json) => PostFile(
      height: json['height'] as int?,
      id: json['id'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$PostFileToJson(PostFile instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
    };

PostTag _$PostTagFromJson(Map<String, dynamic> json) => PostTag(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PostTagToJson(PostTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
