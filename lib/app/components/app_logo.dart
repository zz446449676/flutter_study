import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLogo({
    this.size = 32,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    Color _color;

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    if (color == null) {
      _color = isDarkMode ? Colors.grey : Colors.black;
    } else {
      _color = color!;
    }

    return Image.asset(
      'images/favicon.ico',
      width: size,
      color: _color,
    );
  }
}
