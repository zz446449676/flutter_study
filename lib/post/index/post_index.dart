import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/index/components/post_index_latest.dart';
import 'package:xb2_flutter/post/index/components/post_index_popular.dart';

class PostIndex extends StatelessWidget {
  const PostIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        PostIndexLatest(),
        PostIndexPopular(),
      ],
    );
  }
}
