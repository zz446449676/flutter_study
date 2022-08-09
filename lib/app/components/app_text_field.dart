import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.labelText,
    this.onChanged,
    required this.controller,
    this.canValidate = true,
    this.isMultiline = false,
    this.enabled = true
  }) : super(key: key);

  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller; // 控制文本输入
  final bool canValidate; // 是否启用自动验证
  final bool isMultiline; // 是否支持多行输入
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardType;

    if (isMultiline) {
      keyboardType = TextInputType.multiline;
    }
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        maxLines: isMultiline ? null : 1,
        decoration: InputDecoration(labelText: labelText),
        onChanged: onChanged,
        // 验证用户数据
        autovalidateMode: canValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
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
