import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

// explicitToJson: true 作用是，当这个参数里有嵌套其他类型时，会调用toJson解构出来
@JsonSerializable(explicitToJson: true)
class Post{
  int? id;
  String? title;
  String? content;
  PostUser? user;
  int? totalComments;
  PostFile? file;
  List<PostTag>? tags;
  int? totalLikes;
  int? liked;

  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.totalComments,
    this.file,
    this.liked,
    this.tags,
    this.totalLikes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostUser{
  int? id;
  String? name;
  int? avatar;

  PostUser({
    this.id,
    this.avatar,
    this.name,
  });

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return _$PostUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostFile{
  int? id;
  int? width;
  int? height;

  PostFile({
    this.height,
    this.id,
    this.width,
  });

  factory PostFile.fromJson(Map<String, dynamic> json) {
    return _$PostFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostFileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostTag{
  int? id;
  String? name;

  PostTag({
    this.id,
    this.name,
  });

  factory PostTag.fromJson(Map<String, dynamic> json) {
    return _$PostTagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostTagToJson(this);
}




