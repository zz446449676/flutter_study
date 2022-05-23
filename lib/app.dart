
import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_floating_action_button.dart';
import 'package:xb2_flutter/app/components/app_page_aside.dart';
import 'package:xb2_flutter/app/components/app_page_bottom.dart';
import 'package:xb2_flutter/app/components/app_page_header.dart';
import 'package:xb2_flutter/app/components/app_page_main.dart';
import 'package:xb2_flutter/app/themes/app_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: DefaultTabController(
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
      ),
    );
  }
}