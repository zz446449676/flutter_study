import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  const AppPageHeaderActionsMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postIndexModel = context.watch<PostIndexModel>();

    return PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Icon(
              Icons.view_agenda_outlined,
              color: postIndexModel.layout == PostListLayout.stack ?
              Theme.of(context).primaryColor : null,
            ),
            value: PostListLayout.stack,
          ),
          PopupMenuItem(
            child: Icon(
              Icons.dashboard_outlined,
              color: postIndexModel.layout == PostListLayout.grid ?
              Theme.of(context).primaryColor : null,
            ),
            value: PostListLayout.grid,
          ),
        ],
      icon: const Icon(Icons.more_horiz),
      offset: const Offset(0,50),
      onCanceled: () {
          print('popupMenuButton: onCanceled');
      },
      onSelected: (PostListLayout value) {
        postIndexModel.storeLayout(value);
        print('popupMenuButton: onSelected $value');
      },
    );
  }
}
