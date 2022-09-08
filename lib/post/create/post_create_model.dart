import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class PostCreateModel extends ChangeNotifier {
  final AppService appService;

  String? title;
  String? content;
  PlatformFile? selectedFile; // 用户要上传的文件
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

  setSelectedFiled(PlatformFile data) {
    selectedFile = data;
    notifyListeners();
  }

  setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  reset() {
    title = null;
    content = null;
    selectedFile = null;
  }

  bool hasData() {
    return title != null || content != null || selectedFile != null
        ? true
        : false;
  }

  // 定义一个上传内容的方法
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

  // 定义一个上传文件的方法
  Future<bool> createFile({required int postId}) async {
    final response = await appService.apiHttpClient.uploadImage(file: selectedFile!, postId: postId);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw HttpException('上传文件失败了。');
    }
  }
}