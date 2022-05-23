import 'package:flutter/material.dart';
import 'package:xb2_flutter/playground/playground.dart';
import 'package:xb2_flutter/post/create/post_create.dart';
import 'package:xb2_flutter/post/index/post_index.dart';
import 'package:xb2_flutter/user/profile/user_profile.dart';

class AppPageMain extends StatelessWidget {
  AppPageMain({Key? key, this.currentIndex = 2}) : super(key: key);

  final int currentIndex;
  // 一组页面主体小部件
  final pageMain = [
    // 发现
    const PostIndex(),

    // 添加
    const PostCreate(),

    // 用户
    const UserProfile(),

    // 练习
    const Playground(),
  ];

  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}
