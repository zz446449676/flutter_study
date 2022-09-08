import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class ApiHttpClient extends http.BaseClient {
  final String token;

  ApiHttpClient({
    required this.token,
  });

  // 添加一个HttpClient,用发送http时向报文添加头部数据等
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }
    // 将报文发送出去
    return request.send();
  }
  
  // 定义一个上传文件所用方法
  Future<http.StreamedResponse> uploadImage({
    // 添加两个参数
    required PlatformFile file, // 所要上传的文件
    required int postId, // 要上传文件的id
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/files?post=$postId');

    // 声名一个上传用的请求
    final request = http.MultipartRequest('POST', uri);

    // 因为上传文件需要验证用户的身份，所以要设置头部数据，校验用户身份
    request.headers.putIfAbsent('Authorization', () => 'Bearer $token');

    // 定义一个文件上传解析器
    final multipartFile = await http.MultipartFile.fromPath(
      'file', // 此字段是服务端定义的
      file!.path!,
      contentType: MediaType('image', file.extension ?? 'jpg'),
    );

    // 将文件解析器添加进请求中
    request.files.add(multipartFile);
    return request.send();
  }
}

class AppService extends ChangeNotifier {
  final AuthModel authModel;
  late ApiHttpClient apiHttpClient;

  AppService({
    required this.authModel,
  }) {
    apiHttpClient = ApiHttpClient(token: authModel.token);
  }
}