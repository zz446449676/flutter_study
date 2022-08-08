class HttpException implements Exception {
  late String message;

  HttpException(String? message) {
    this.message = message ?? '网络请求出了点问题！';
  }

  @override
  String toString() {
    return 'HttpException: $message';
  }
}