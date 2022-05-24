
import 'package:flutter/cupertino.dart';
import 'package:xb2_flutter/app/router/app_route_configuration.dart';

// 路由信息解析器，操作系统或者平台的路由器会将设备的路由信息交给路由信息解析器
// 路由信息解析器解析出来后就变成我们自己定义好的路由配置信息AppRouteConfiguration
// 最后把路由配置信息交给路由代表RouteDelegate去构建出Navigator
class AppRouteInformationParser extends RouteInformationParser<AppRouteConfiguration> {

  // 当路平台的路由信息发生变化时，会把这些信息交给这个方法去处理
  // 经过parseRouteInformation处理后的信息会交给RouteDelegate 的 setNewRoutePath 方法
  @override
  Future<AppRouteConfiguration> parseRouteInformation(RouteInformation routeInformation) async{
    print('解析路由信息：${routeInformation.location}');
    if (routeInformation.location == '/about') {
      return AppRouteConfiguration.about();
    }
    return AppRouteConfiguration.home();
  }

  // 恢复路由信息，根据当前设备的路由页面从而更新操作系统上的路由信息
  @override
  restoreRouteInformation(configuration) {
    if(configuration.isHomePage) {
      return RouteInformation(location: '/');
    }
    else if (configuration.isAboutPage) {
      return RouteInformation(location: '/about');
    }
  }
}