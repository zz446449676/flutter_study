import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import '../post.dart';

class PostMedia extends StatelessWidget {
  const PostMedia({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final fileId = post.file?.id;
    final imageUrl = '${AppConfig.apiBaseUrl}/files/$fileId/serve?size=medium';
    return Container(
      child: Image.network(imageUrl, fit: BoxFit.cover,),
    );
  }
}
