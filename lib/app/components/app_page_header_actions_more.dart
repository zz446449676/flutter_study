import 'package:flutter/material.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  const AppPageHeaderActionsMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            child: Icon(
              Icons.view_agenda_outlined,
              color: Colors.black54,
            ),
            value: 'stack',
          ),
          const PopupMenuItem(
            child: Icon(
              Icons.dashboard_outlined,
              color: Colors.black54,
            ),
            value: 'grid',
          ),
        ],
      icon: const Icon(Icons.more_horiz),
      offset: const Offset(0,50),
      onCanceled: () {
          print('popupMenuButton: onCanceled');
      },
      onSelected: (value) {
        print('popupMenuButton: onSelected $value');
      },
    );
  }
}
