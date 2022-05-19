import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color color;

  const AppLogo({
    this.size = 32,
    this.color = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/favicon.ico',
      width: size,
      color: color,
    );
  }
}
