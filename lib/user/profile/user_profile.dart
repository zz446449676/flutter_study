import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Icon(
            Icons.landscape_rounded,
            color: Colors.black,
            size: 128,
          ),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Login');
              }
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
