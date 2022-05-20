import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_bottom_sheet.dart';

class AppFloatingActionButton extends StatefulWidget {
  const AppFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<AppFloatingActionButton> createState() => _AppFloatingActionButtonState();
}

class _AppFloatingActionButtonState extends State<AppFloatingActionButton> {
  // 是否正在显示底部面板
  bool isBottomSheetShown = false;
  Icon floatingActionButtonIcon() {
    return isBottomSheetShown ? const Icon(Icons.close) : const Icon(Icons.share_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: floatingActionButtonIcon(),
      onPressed: () {
        var bottomSheetController;
        if (kDebugMode) {
          print('floating action button');
        }
        //显示底部面板
        if(!isBottomSheetShown) {
          bottomSheetController = showBottomSheet(
            context: context,
            builder: (context) => const AppBottomSheet(),
          );
          setState(() {
            isBottomSheetShown = true;
          });
        }
        // 关闭底部面板
        else if(isBottomSheetShown) {
          return Navigator.pop(context);
        }

        // 关闭底部面板以后
        bottomSheetController.closed.then((value) {
          setState(() {
            isBottomSheetShown = false;
          });
        });
      },
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
    );
  }
}
