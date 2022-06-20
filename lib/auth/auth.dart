import 'package:json_annotation/json_annotation.dart';
part 'auth.g.dart';

// 请求登录时需要向服务端提供的数据结构
@JsonSerializable(explicitToJson: true)
class LoginData{
  String name;
  String password;

  LoginData({
    required this.name,
    required this.password,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return _$LoginDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

// 当登录成功后，服务端返回给移动端的数据结构
@JsonSerializable(explicitToJson: true)
class Auth{
  int id;
  String name;
  String token;

  Auth({
    required this.id,
    required this.name,
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return _$AuthFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
