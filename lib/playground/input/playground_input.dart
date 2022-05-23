import 'package:flutter/material.dart';
import 'package:xb2_flutter/user/create/user_create.dart';

class PlaygroundInput extends StatelessWidget {
  const PlaygroundInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.white,
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      child: const UserCreate(),
    );
  }
}
