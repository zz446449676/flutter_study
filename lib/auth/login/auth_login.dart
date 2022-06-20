import 'package:flutter/material.dart';
import 'package:xb2_flutter/auth/login/components/auth_login_form.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户登录'),
      ),
      body: const AuthLoginForm(),

      // 避免底部弹出软键盘导致页面结构发生改变，从而造成页面显示溢出的错误BOTTOM OVERFLOWED BY xx pixels
      resizeToAvoidBottomInset: false,
    );
  }
}
