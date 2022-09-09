import 'package:flutter/material.dart';

import '../post.dart';

class PostContent extends StatelessWidget {
  const PostContent({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        post.content!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
