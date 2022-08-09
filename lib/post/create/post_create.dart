import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/create/components/post_create_form.dart';
class PostCreate extends StatelessWidget {
  const PostCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: PostCreateForm(),
      ),
    );
  }
}
