import 'package:flutter/material.dart';
import 'package:xb2_flutter/auth/login/components/auth_login_form.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AuthLoginForm(),
    );
  }
}
