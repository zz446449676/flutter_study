import 'package:flutter/material.dart';

import 'app_page_aside.dart';
import 'app_page_bottom.dart';
import 'app_page_header.dart';
import 'app_page_main.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  // 底部导航栏当前项目
  int currentAppBottomNavigationBarItem = 2;
  // 是否展示AppBar
  bool showAppBar = false;
  //点击底部导航栏事件处理
  void onTapAppBottomNavigationBarItem(int index) {
    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppBar = currentAppBottomNavigationBarItem == 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: showAppBar ? const AppPageHeader() : null,
        body: AppPageMain(currentIndex: currentAppBottomNavigationBarItem),
        bottomNavigationBar: AppPageBottom(
          currentIndex: currentAppBottomNavigationBarItem,
          onTap: onTapAppBottomNavigationBarItem,
        ),
        //floatingActionButton: const AppFloatingActionButton(),
        drawer: const AppPageAside(),
      ),
    );
  }
}
