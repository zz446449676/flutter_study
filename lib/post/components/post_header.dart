import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/components/post_actions.dart';
import 'package:xb2_flutter/post/post.dart';
import 'package:xb2_flutter/user/components/user_avatar.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(user: post.user!),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // 最后的！是说明这个参数不可能为空
                  post.title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  post.user!.name!,
                ),
              ],
            ),
          ),
          PostActions(post: post),
        ],
      ),
    );
  }
}
