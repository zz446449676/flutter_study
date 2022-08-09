import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/post/post.dart';

/// 定义一个枚举数据类，用来决定内容列表以何种方式进行展示
enum PostListLayout {
  stack,
  grid,
}

class PostIndexModel extends ChangeNotifier {
  List<Post>? posts;
  final AppService appService;
  PostListLayout? layout;

  PostIndexModel({
    this.posts,
    required this.appService,
    this.layout = PostListLayout.stack,
});

  setLayout(PostListLayout data) {
    layout = data;
    notifyListeners();
  }

  storeLayout(PostListLayout data) async {
    setLayout(data);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('postListLayout', data.toString());
  }

  List<Post> parsePosts(responseBody) {
    final List<Post> parsed = jsonDecode(responseBody) // 从body中解析出json数据
        .map<Post>((item) => Post.fromJson(item))  // 把json数据转为map，提供给Post的构造方法，生成对应的Post实例
        .toList();  // 最后把这些所有的Post实例放进List里
    return parsed;
  }

  Future<List<Post>>getPosts({required String sort}) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts?sort=$sort');
    final response = await appService.apiHttpClient.get(uri);

    final parsed = parsePosts(response.body);

    posts = parsed;
    notifyListeners();

    return parsed;
  }
}