import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';
import 'package:xb2_flutter/like/create/like_create_model.dart';
import 'package:xb2_flutter/like/destroy/like_destroy_model.dart';
import 'package:xb2_flutter/like/like_provider.dart';

import '../post.dart';

/// 用户点赞、取消点赞、评论的小部件
/// 注意：按常规情况来看，这个小部件应该设置为 StatefulWidget , 因为用户点赞后，UI会发生改变
/// 但是在这个小部件中我们使用 Provider 对 LikeCreateModel 进行 watch， 并且 LikeCreateModel 继承自 ChangeNotifier, 当请求点赞接口返回成功后，会调用 ChangeNotifier() 通知所用使用到它的小部件进行 rebuild，从而达到刷新 UI 的效果
class PostActions extends StatelessWidget {
  const PostActions({Key? key, required this.post}) : super(key: key);
  final Post post;

  increaseTotalLikes() {
    post.totalLikes = post.totalLikes! + 1;
  }

  decreaseTotalLikes() {
    post.totalLikes = post.totalLikes != 0 ? post.totalLikes! - 1 : 0;
  }

  liked() {
    post.liked = 1;
    increaseTotalLikes();
  }

  unliked() {
    post.liked = 0;
    decreaseTotalLikes();
  }

  @override
  Widget build(BuildContext context) {
    final likeCreateModel = context.watch<LikeCreateModel>();
    final likeDestroyModel = context.watch<LikeDestroyModel>();

    onTapLikeAction() async {
      if (post.liked == 0) {// 0 表示用户还未点赞此内容， 1 表示用户已经点赞此内容；
        try {
          await likeCreateModel.createUserLikePost(post.id!);
          liked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message))
          );
        }
      } else {
        try {
          await likeDestroyModel.deleteUserLikePost(post.id!);
          unliked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message))
          );
        }
      }
    }

    final likeAction = Row(
      children: [
        GestureDetector(
          child: Icon(post.liked == 0 ? Icons.favorite_border_outlined : Icons.favorite),
          onTap: onTapLikeAction,
        ),
        if (post.totalLikes != 0 )
          Container(
            padding: const EdgeInsets.only(left: 4),
            child: Text('${post.totalLikes}'),
          ),
      ],);

    final commentAction = Row(
      children: [
        const Icon(Icons.comment_outlined),
        if(post.totalComments != 0)
          Container(
            padding: const EdgeInsets.only(left: 4),
            child: Text('${post.totalComments}'),
          )
      ],);

    return Container(
      child: Row(
        children: [
          likeAction,
          SizedBox(width: 16,),
          commentAction,
        ],
      ),
    );
  }
}
