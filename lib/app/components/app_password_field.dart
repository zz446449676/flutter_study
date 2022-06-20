import 'package:flutter/material.dart';

class AppPasswordField  extends StatelessWidget {
  const AppPasswordField ({Key? key, this.labelText, this.onChanged}) : super(key: key);
  final String? labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText ?? '密码',
        ),
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return '请设置6位以上的密码';
          }
          return null;
        },
      ),

    );
  }
}
