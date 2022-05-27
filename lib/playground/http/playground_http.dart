import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xb2_flutter/user/user.dart';

class PlaygroundHttp extends StatefulWidget {
  const PlaygroundHttp({Key? key}) : super(key: key);

  @override
  State<PlaygroundHttp> createState() => _PlaygroundHttpState();
}

class _PlaygroundHttpState extends State<PlaygroundHttp> {
  String? currentUserName = '螺纹钢';

  String? currentUserToken;

  getUser() async {
    final uri = Uri.parse('https://nid-node.ninghao.co/users/78');
    final response = await http.get(uri);

    print('状态码 : ${response.statusCode}');
    print('响应主体 : ${response.body}');

    if (response.statusCode == 200) {
      final user = User.fromJson(response.body);
      print('解码之后：$user');
      print('user: ${user.name}');
      currentUserName = user.name;
    }
  }

  createUser() async {
    final name = '螺纹钢';
    final password = '123456';
    final uri = Uri.parse('https://nid-node.ninghao.co/users');

    final response = await http.post(uri, body: {
      'name': name,
      'password': password,
    });
    print('状态码 : ${response.statusCode}');
    print('响应主体 : ${response.body}');
  }

  login() async {
    final name = currentUserName;
    final password = '123456';
    final uri = Uri.parse('https://nid-node.ninghao.co/login');
    final response = await http.post(uri, body: {
      'name': name,
      'password': password,
    });
    print('状态码 : ${response.statusCode}');
    print('响应主体 : ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        currentUserName = responseBody['name'];
        currentUserToken = responseBody['token'];
      });
    }
  }

  updateUser() async {
    final name = '罗文刚';
    final password = '123456';
    final uri = Uri.parse('https://nid-node.ninghao.co/users');

    // 头部数据，保存Token
    final headers = {
      'Authorization': 'Bearer $currentUserToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // 把数据加工厂json格式的
    final body = jsonEncode({
      'validate': {
        'password':password,
      },
      'update': {
        'name': name
      },
    });
    final response = await http.patch(uri, body: body, headers: headers);
    print('状态码 : ${response.statusCode}');
    print('响应主体 : ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        currentUserName = responseBody['name'];
        currentUserToken = responseBody['token'];
      });

      setState(() {
        currentUserName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentUserName ?? '未登录', style: Theme.of(context).textTheme.headline6,),
          ElevatedButton(
              onPressed: getUser,
              child: const Text('发送请求')),
          ElevatedButton(
              onPressed: createUser,
              child: const Text('创建用户')),
          ElevatedButton(
              onPressed: login,
              child: const Text('用户登录')),
          ElevatedButton(
              onPressed: updateUser,
              child: const Text('更新信息')),
        ],
      ),
    );
  }
}
