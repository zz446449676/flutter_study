import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  const AppHeaderText({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 32,
          // 设置文字粗细
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
