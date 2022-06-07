import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/post/post.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.user, this.size = 32}) : super(key: key);
  final PostUser user;
  final double size;

  @override
  Widget build(BuildContext context) {
    final userId = user.id;
    final avatarUrl = '${AppConfig.apiBaseUrl}/users/$userId/avatar?size=medium';
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
