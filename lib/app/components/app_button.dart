import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, this.text, required this.onPressed}) : super(key: key);
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('${text ?? '按钮'}'),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          minimumSize: const Size(double.infinity, 60),
        ),
      ),
    );
  }
}
