import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class AuthLoginForm extends StatelessWidget {
  const AuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用Provider提供的数据
    // listen 参数如果为true，则开启监听，当数据发生改变时重构小部件。
    final authModel = Provider.of<AuthModel>(context, listen: true);

    final loginButton = ElevatedButton(
        onPressed: () {
          print('登录状态 1 ： ${authModel.isLoggedIn}');
          authModel.login();
          print('登录状态 2 ： ${authModel.isLoggedIn}');
        },
        child: const Text('登录'));

    final logoutButton = ElevatedButton(
        onPressed: () {
          print('登录状态 1 ： ${authModel.isLoggedIn}');
          authModel.logout();
          print('登录状态 2 ： ${authModel.isLoggedIn}');
        },
        child: const Text('注销'));
    return Container(
      child: authModel.isLoggedIn? logoutButton : loginButton,
    );
  }
}
