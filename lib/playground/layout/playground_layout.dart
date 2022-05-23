import 'package:flutter/material.dart';
import 'package:xb2_flutter/playground/layout/components/playground_layout_item.dart';

class PlaygroundLayout extends StatelessWidget {
  const PlaygroundLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      // 让控件大小占用能够占用的所有空间，类似于原生开发中的match_parent
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
          child: Column(
            // Column对齐的主轴是在垂直方向的,也就是y轴，交叉轴就是X轴
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              PlaygroundLayoutItem(textContent: '章周帅哥',),
              PlaygroundLayoutItem(textContent: '螺纹钢蠢货',),
              PlaygroundLayoutItem(textContent: '绿豆沙雕',),
            ],
          )),
    );
  }
}
