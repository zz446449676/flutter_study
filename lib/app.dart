import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_provider.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/app/router/app_route_information_parser.dart';
import 'package:xb2_flutter/app/router/app_router_delegate.dart';
import 'package:xb2_flutter/app/themes/app_theme.dart';
import 'package:xb2_flutter/auth/auth_model.dart';
import 'package:xb2_flutter/like/like_provider.dart';
import 'package:xb2_flutter/post/post_provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // 新建一个 AppModel 实例
  final AppModel appModel = AppModel();
  final AuthModel authModel = AuthModel();

  bool initializing = true;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAuth = prefs.containsKey('auth');

    if (hasAuth) {
      final auth = Auth.fromJson(
        jsonDecode(prefs.getString('auth')!),
      );
      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }


  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        // => 为 return 的缩写， ChangeNotifierProvider 返回appModel
        // 通过value方法向Provider中初始构造一个authModel实例
        ChangeNotifierProvider<AuthModel>.value(value: authModel,),
        ChangeNotifierProvider<AppModel>.value(value: appModel,),
        // ... ，称为spread展开操作符，它允许您将集合、集合等拆分为其项
        ...appProviders,
        ...postProviders,
        ...likeProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // 路由方法1：构建路由表，每一个route就相当于原生里的Activity,此方法用于不携带参数的路由
        // initialRoute: '/',

        // routes: {
        //   '/': (context) => const AppHome(),
        // },
        //
        // //路由方法2： 使用onGenerateRoute,这个方法可以携带参数，类似于原生里的intent携带数据
        // onGenerateRoute: (settings) {
        //   print(settings);
        //   if (settings.name == '/about') {
        //     return MaterialPageRoute(builder: (context) => const About());
        //   }
        //   // 通过一路由的名字提取参数
        //   final uri = Uri.parse(settings.name ?? '');//两个？的意思是，如果name位null，则使用''字符串
        //
        //   // 例如处理posts/:postId时，
        //   // pathSegments就有两个片段数组，分别为posts、postId
        //   if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'posts') {
        //     final postId = uri.pathSegments[1];
        //     return MaterialPageRoute(builder: (context) => PostShow(postId: postId));
        //   }
        // },

        //路由方法 3：使用Navigator 声明式接口（Pages API）
        // home: Router(
        //   routerDelegate: AppRouterDelegate(appModel),
        //   routeInformationParser: AppRouteInformationParser(),
        // ),

        routerDelegate: AppRouterDelegate(appModel),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}