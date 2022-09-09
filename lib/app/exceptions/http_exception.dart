import 'app_exception.dart';

class HttpException extends AppException {
  HttpException([String message = '网络请求出了点问题！']) : super(message);
}