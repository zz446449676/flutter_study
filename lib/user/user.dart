import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// 序列化一个类，一会用命令行把这个标记的类自动生成一些代码
// 在终端执行flutter pub run build_runner build 来生成user.g.dart文件
@JsonSerializable()
class User {
  final int? id;
  final String? name;
  final int? avatar;

  User({this.id, this.name, this.avatar});

  // 添加一个工厂方法, 根据我们提供的json数据，自动的构建出一个User实例
  // factory 关键字的作用：
  //   1. 让构造方法带有了返回值（返回值类型被固定位该类型或者其子类）
  //   2. 用于构造单例模式
  factory User.fromJson(String json) {
    final user = jsonDecode(json);
    //return User(id: user['id'], name: user['name']);
    return _$UserFromJson(user);
  }
}