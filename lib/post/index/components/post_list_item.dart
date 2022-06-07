import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/components/post_header.dart';
import 'package:xb2_flutter/post/components/post_media.dart';
import '../../post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.item}) : super(key: key);
  final Post item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          PostMedia(post: item),
          const SizedBox(height: 8,),
          PostHeader(post: item),
        ],
      ),
    );
  }
}
