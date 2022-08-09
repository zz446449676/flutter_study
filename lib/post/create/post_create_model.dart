import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class PostCreateModel extends ChangeNotifier {
  final AppService appService;

  String? title;
  String? content;
  bool loading = false;

  PostCreateModel({
    required this.appService,
  });

  setTitle(String? title) {
    this.title = title;
  }

  setContent(String? content) {
    this.content = content;
  }

  setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  reset() {
    title = null;
    content = null;
  }

  Future<int> createPost() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts');
    final body = {
      'title': title,
      'content': content
    };

    final response = await appService.apiHttpClient.post(uri, body: body);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final postId = responseBody['insertId'];
      return postId;
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}