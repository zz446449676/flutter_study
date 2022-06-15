import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/components/post_content.dart';
import 'package:xb2_flutter/post/components/post_header.dart';
import 'package:xb2_flutter/post/components/post_media.dart';
import 'package:xb2_flutter/post/components/post_tags.dart';
import 'package:xb2_flutter/post/post.dart';

class PostShowMain extends StatelessWidget {
  const PostShowMain({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    // 右上方关闭按钮
    final closeButton = MaterialButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      child: const Icon(
        Icons.close,
        size: 24,
        color: Colors.white60,
      ),
      color: Colors.black26,
      padding: const EdgeInsets.all(4),
      shape: const CircleBorder(),
      // 添加阴影
      elevation: 0,
    );

    // 顶部图片
    final postMedia = Stack(
      children: [
        PostMedia(post: post),
        Positioned(
          right: 0,
          top: 32,
          child: closeButton,
        ),
      ],
    );

    // 作者信息
    final postHeader = Container(
      padding: const EdgeInsets.all(16),
      child: PostHeader(post: post),
    );

    // 分割线
    const divider = Divider(
      height: 16,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );

    // 图片所搭配的文字内容
    final postContent = Container(
      padding: EdgeInsets.all(16),
      child: PostContent(post: post,),
    );
    
    // 图片标签
    final postTags = Container(
      padding: const EdgeInsets.all(16),
      // 如果 post.tags == null 则tags = []
      child: PostTags(tags: post.tags ?? [],),
    );

    // 如果页面过长，可以滚动
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postMedia,
            postHeader,
            divider,
            if (post.content != null) postContent,
            if (post.tags != null) postTags,
          ],
        ),
      ),
    );
  }
}
