import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 除了使用Provider.of方法来获取AuthModel之外，也可使用Consumer来获取数据
    return Consumer<AuthModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Center(
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
                child: Text(value.isLoggedIn? value.name : "未登录"),
              )
            ],
          ),
        );
      },
    );
  }
}
