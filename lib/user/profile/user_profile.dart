import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 准备身份验证
    // Provider提供的read方法只是读取共享数据，而watch方法可以监听共享数据，当数据发生改变时会重新build
    final appModel = context.read<AppModel>();
    final authModel = context.watch<AuthModel>();

    // 登录按钮
    final login = TextButton(
      child: const Text('请登录'),
      onPressed: (){
        appModel.setPageName('AuthLogin');
      },
    );

    // 用户退出登录
    final userProfile = TextButton(
      child: Text(authModel.name),
      onPressed: (){
        authModel.logout();
      },
    );

    // 除了使用Provider.of方法来获取AuthModel之外，也可使用Consumer来获取数据
    // return Consumer<AuthModel>(
    //   builder: (BuildContext context, value, Widget? child) {
    //     return Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children:  [
    //           const Icon(
    //             Icons.landscape_rounded,
    //             color: Colors.black,
    //             size: 128,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               if (kDebugMode) {
    //                 print('Login');
    //               }
    //             },
    //             child: Text(value.isLoggedIn? value.name : "未登录"),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: authModel.isLoggedIn ? userProfile : login,
      ),
    );
  }
}
