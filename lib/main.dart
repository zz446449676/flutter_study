import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

void main() async {
  // 加载 .env 配置文件
  await dotenv.load(fileName: '.env');
  runApp(const App());
}
