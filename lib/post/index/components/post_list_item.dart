import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/post/components/post_header.dart';
import 'package:xb2_flutter/post/components/post_media.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';
import '../../post.dart';
import 'package:provider/provider.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.item, this.layout = PostListLayout.stack}) : super(key: key);
  final Post item;
  final PostListLayout layout;

  @override
  Widget build(BuildContext context) {
    // 通过provider读取在app.dart里所共享给子部件的数据
    final appModel = context.read<AppModel>();
    final postShowModel = context.read<PostShowModel>();

    final postListItemMediaMask = Positioned.fill(
      child: Material(
        // 透明
        color: Colors.transparent,

        // InkWenn 是一个矩形区域可响应用户点击触摸的widget，里面可设置点击效果
        child: InkWell(
          // 溅墨效果颜色
          splashColor: Colors.deepPurpleAccent.withOpacity(0.3),
          onTap:  () {
            appModel.setPageName('PostShow');
            appModel.setResourceId('${item.id}');
            postShowModel.setPost(item);
          },
        ),
      ),
    );

    final postListItemMedia = Stack(
      fit: layout == PostListLayout.grid ? StackFit.expand : StackFit.loose,
      children: [
        PostMedia(post: item),
        postListItemMediaMask,
      ],
    );

    final stackListItem = Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          postListItemMedia,
          const SizedBox(height: 8,),
          PostHeader(post: item),
        ],
      ),
    );

    final gridListItem = Container(
      child: postListItemMedia,
    );

    Widget postListItem = stackListItem;

    if (layout == PostListLayout.grid) {
      postListItem = gridListItem;
    }

    return postListItem;
  }
}
