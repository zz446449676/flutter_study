import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  bool showAppBar = true;
  //点击底部导航栏事件处理
  void onTapAppBottomNavigationBarItem(int index) {
    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppBar = currentAppBottomNavigationBarItem == 0;
    });
  }
  // 一组页面主体小部件
  final pageMain = [
    // 发现
    const TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128,
          color: Colors.black12,
        ),
        Icon(
          Icons.local_fire_department,
          size: 128,
          color: Colors.black12,
        ),
      ],
    ),

    // 添加
    const Center(
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 128,
        color: Colors.black12,
      ),
    ),

    // 用户
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Icon(
            Icons.landscape_rounded,
            color: Colors.black,
            size: 128,
          ),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Login');
              }
            },
            child: const Text('Login'),
          )
        ],
      ),
    ),
  ];
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
          appBar: showAppBar ? AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            title: Image.asset('images/favicon.ico', width: 24, color: Colors.white,),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: '最近'),
                Tab(text: '热门'),
              ],),
          ) : null,
          body: pageMain.elementAt(currentAppBottomNavigationBarItem),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentAppBottomNavigationBarItem,
            onTap: onTapAppBottomNavigationBarItem,
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
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.share_outlined),
            onPressed: () {
              if (kDebugMode) {
                print('floating action button');
              }
            },
            backgroundColor: Colors.black87,
            foregroundColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}