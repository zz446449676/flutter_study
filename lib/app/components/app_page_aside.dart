import 'package:flutter/material.dart';

class AppPageAside extends StatelessWidget {
  const AppPageAside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text('章周'), 
              accountEmail: Text('446449676@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/zhang.jpg'),
            ),
          ),

          // 作品
          ListTile(
            title: const Text('作品',
            // 文字设置为右对齐
            textAlign: TextAlign.right,
            ),
            // 把小图标显示在结尾位置
            trailing: const Icon(
              Icons.image_outlined,
              color: Colors.black26,
              size: 22,
            ),
            onTap: () {},
          ),
          // 评论
          ListTile(
            title: const Text('评论',
              // 文字设置为右对齐
              textAlign: TextAlign.right,
            ),
            // 把小图标显示在结尾位置
            trailing: const Icon(
              Icons.comment_outlined,
              color: Colors.black26,
              size: 22,
            ),
            onTap: () {},
          ),

          const Divider(),

          // 账户
          ListTile(
            title: const Text('账户',
              // 文字设置为右对齐
              textAlign: TextAlign.right,
            ),
            // 把小图标显示在结尾位置
            trailing: const Icon(
              Icons.manage_accounts_outlined,
              color: Colors.black26,
              size: 22,
            ),
            onTap: () {},
          ),

          // 管理
          ListTile(
            title: const Text('管理',
              // 文字设置为右对齐
              textAlign: TextAlign.right,
            ),
            // 把小图标显示在结尾位置
            trailing: const Icon(
              Icons.collections_outlined,
              color: Colors.black26,
              size: 22,
            ),
            onTap: () {},
          ),

          const Divider(),

          // 退出
          ListTile(
            title: const Text('退出',
              // 文字设置为右对齐
              textAlign: TextAlign.right,
            ),
            // 把小图标显示在结尾位置
            trailing: const Icon(
              Icons.logout_outlined,
              color: Colors.black26,
              size: 22,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
