import 'package:flutter/material.dart';

class PlaygroundRouting extends StatelessWidget {
  const PlaygroundRouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.white,
      child: Center(
        child: TextButton(
          child: const Text('查看内容'),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return const About();
            //     }),
            // );

            // Navigator.pushNamed(context, '/about', arguments: {'user': '章周'});
            Navigator.pushNamed(context, '/posts/110', arguments: {'user': '章周'});
          },
        ),
      ),
    );
  }
}
