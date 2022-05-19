import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_logo.dart';

class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      title: const AppLogo(size: 28),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      ],
      bottom: const TabBar(
        tabs: [
          Tab(text: '最近'),
          Tab(text: '热门'),
        ],),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(100);
}
