import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/components/app_home.dart';
import 'package:xb2_flutter/app/themes/app_theme.dart';
import 'package:xb2_flutter/auth/auth_model.dart';
import 'package:xb2_flutter/playground/routing/components/about.dart';
import 'package:xb2_flutter/post/show/post_show.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provider 用于让不同小部件之间实现共享数据的，同时也能根据数据是否改变，来维护部件的状态。
      // Provider通过create方法返回一个AuthModel实例，这样MaterialApp的所有后代都可以使用AuthModel这个数据
      create: (BuildContext context) => AuthModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // 路由方法1：构建路由表，每一个route就相当于原生里的Activity,此方法用于不携带参数的路由
        initialRoute: '/',
        routes: {
          '/': (context) => const AppHome(),
        },

        //路由方法2： 使用onGenerateRoute,这个方法可以携带参数，类似于原生里的intent携带数据
        onGenerateRoute: (settings) {
          print(settings);
          if (settings.name == '/about') {
            return MaterialPageRoute(builder: (context) => const About());
          }
          // 通过一路由的名字提取参数
          final uri = Uri.parse(settings.name ?? '');//两个？的意思是，如果name位null，则使用''字符串

          // 例如处理posts/:postId时，
          // pathSegments就有两个片段数组，分别为posts、postId
          if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'posts') {
            final postId = uri.pathSegments[1];
            return MaterialPageRoute(builder: (context) => PostShow(postId: postId));
          }
        },
      ),
    );
  }
}