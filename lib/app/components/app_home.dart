import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/create/post_create_model.dart';

import 'app_page_aside.dart';
import 'app_page_bottom.dart';
import 'app_page_header.dart';
import 'app_page_main.dart';

import 'package:provider/provider.dart';

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
  void onTapAppBottomNavigationBarItem(int index) async {
    final postCreateModel = context.read<PostCreateModel>();

    final retainDataAlertDialog = AlertDialog(
      title: const Text('是否保留未发布的内容？'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('否'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('是'),
        ),
      ],
    );

    if (currentAppBottomNavigationBarItem == 1 && postCreateModel.hasData()) {
      final retainDataResult = await showDialog(
          context: context,
          builder: (context) => retainDataAlertDialog,
      );

      if (retainDataResult == null) { // 用户没有去做选择
        return;
      }
      else if (!retainDataResult) { // 用户点击了否
        postCreateModel.reset();
      }
    }
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
        // backgroundColor: Colors.amber,
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
