import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '章周，是个大帅哥',
              style: Theme.of(context).textTheme.headline6,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('返回'))
          ],
        ),
      ),
    );
  }
}
