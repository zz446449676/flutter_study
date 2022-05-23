import 'package:flutter/cupertino.dart';

// 注意：要使用provider让不同的部件提供数据，或者共享数据的前提是，这几个小部件必须在相同的父类中才行
class AuthModel extends ChangeNotifier{
  bool isLoggedIn = false;
  String name = '';

  login() {
    isLoggedIn = true;
    name = '章周';
    print('请求登录！');
    // 加入监听后，只要Model的属性发生改变，那么监听了这个Model以后的小部件都会被重建
    notifyListeners();
  }

  logout() {
    isLoggedIn = false;
    name = '';
    print('退出登录！');
    notifyListeners();
  }
}