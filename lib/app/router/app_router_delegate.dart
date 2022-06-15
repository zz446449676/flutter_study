import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_home.dart';
import 'package:xb2_flutter/app/router/app_route_configuration.dart';
import 'package:xb2_flutter/playground/routing/components/about.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/show/post_show.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';

import '../app_model.dart';

// ChangeNotifier 当数据发生改变时，向使用的类发送通知
// PopNavigatorRouterDelegateMixin 管理删除路由
class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _navigatorKey;
  final AppModel appModel;

  AppRouterDelegate(this.appModel) : _navigatorKey = GlobalKey<NavigatorState>() {
    // 监听appModel
    appModel.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    appModel.removeListener(notifyListeners);
  }

  //当路由信息发生变化时，会调用build方法，重新构建出一个Navigator
  @override
  Widget build(BuildContext context) {
    final postShowModel = context.read<PostShowModel>();
    return Navigator(
      key: _navigatorKey,
      pages: [
        const MaterialPage(child: AppHome(), key: ValueKey('AppHome')),
        if (appModel.pageName == 'About')
          const MaterialPage(child: About(), key: ValueKey('About')),
        if (appModel.pageName == 'PostShow' && appModel.resourceId != null)
          MaterialPage(
              child: PostShow(postId: appModel.resourceId!, post: postShowModel.post),
              key:ValueKey('PostShow'),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          //pop失败
          return false;
        }
        appModel.setPageName('');
        return true;
      },
    );
  }

  // 获取 Navigator 使用的 Key
  @override
  get navigatorKey => _navigatorKey();

  // 设置新路由地址，当路由地址发生变化时，重新构建出Navigator
  @override
  Future<void> setNewRoutePath(configuration) async{
    print('设置新路由地址，setNewRoutePath');
    if(configuration.isHomePage) {
      appModel.setPageName('');
    }
    else if(configuration.isAboutPage) {
      appModel.setPageName('About');
    }
    else if(configuration.isPostShow) {
      appModel.setPageName('PostShow');
      appModel.setResourceId('${configuration.resourceId}');
    }
  }

  
  // 获取当前路由配置，根据当前设备的路由页面更新操作系统上的路由信息,将设备路由同步显示到chrome地址栏中
  @override
  get currentConfiguration {
    if(appModel.pageName == '') {
      return AppRouteConfiguration.home();
    }
    else if (appModel.pageName == 'About') {
      return AppRouteConfiguration.about();
    }
    else if (appModel.pageName == 'PostShow') {
      return AppRouteConfiguration.postShow(appModel.resourceId);
    }
  }
}