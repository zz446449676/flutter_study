import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_no_content.dart';
import 'package:xb2_flutter/post/show/components/post_show_main.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';

import '../post.dart';

class PostShow extends StatefulWidget {
  const PostShow({Key? key, required this.postId, this.post}) : super(key: key);
  final String postId;
  final Post? post;

  @override
  State<PostShow> createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {
  @override
  Widget build(BuildContext context) {
    Post? post = widget.post;

    if (widget.post == null) {
      post = context.watch<PostShowModel>().post;
    }
    return Scaffold(
      body: post != null ? PostShowMain(post: post) : const AppNoContent(),
    );
  }

  @override
  void initState() {
    super.initState();
    if(widget.post == null) {
      context.read<PostShowModel>().getPostById(widget.postId);
    }
  }
}
