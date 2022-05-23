import 'package:flutter/material.dart';

class PostShow extends StatelessWidget {
  const PostShow({Key? key, required this.postId}) : super(key: key);
  final String postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '内容: $postId',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
