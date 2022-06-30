import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:http/http.dart' as http;

// 注意：要使用provider让不同的部件提供数据，或者共享数据的前提是，这几个小部件必须在相同的父类中才行
class AuthModel extends ChangeNotifier{
  String name = '';
  String token = '';
  String userId = '';
  bool get isLoggedIn => token.isNotEmpty;

  // 将Auth信息存储至手机本地Sp文件中
  storeAuth(Auth auth) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth', jsonEncode(auth));
  }

  removeAuth() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth');
  }

  setAuth(Auth auth) {
    userId = '${auth.id}';
    name = auth.name;
    token = auth.token;
    notifyListeners();
  }

  Future<Auth> login(LoginData data) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/login');
    final response = await http.post(uri, body: data.toJson());
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final auth = Auth.fromJson(responseBody);
      userId = auth.id.toString();
      name = auth.name;
      token = auth.token;

      storeAuth(auth);
      // 加入监听后，只要Model的属性发生改变，那么监听了这个Model以后的小部件都会被重建
      notifyListeners();

      return auth;
    } else {
      throw HttpException(responseBody['message'] ?? '网络请求出了点问题');
    }
  }

  logout() {
    userId = '';
    name = '';
    token = '';
    removeAuth();
    notifyListeners();
  }
}