import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, required this.labelText, this.onChanged}) : super(key: key);
  final String labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        onChanged: onChanged,
        // 验证用户数据
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '请填写$labelText';
          }
          return null;
        },
      ),
    );
  }
}
