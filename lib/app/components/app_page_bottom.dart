import 'package:flutter/material.dart';

class AppPageBottom extends StatelessWidget {
  const AppPageBottom({Key? key, this.onTap, this.currentIndex = 2}) : super(key: key);
  final int currentIndex;
  //添加一个名字为onTap的，当int值发生改变时的回调函数
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo),
          label: '添加',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: '用户',
        ),
      ],
    );
  }
}
