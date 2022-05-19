import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.share_outlined),
      onPressed: () {
        if (kDebugMode) {
          print('floating action button');
        }
      },
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
    );
  }
}
