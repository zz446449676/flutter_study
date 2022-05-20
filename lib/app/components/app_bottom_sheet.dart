import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  // 显示对话框
  // 执行完这个函数会返回bool类型的值，当然，用户没有点击按钮时，返回的为null，所以为<bool?>
  Future<bool?> showAppAlertDialog(context) {
    //执行完showDialog指定返回一个bool类型的值
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('帅哥认证中心'),
          content: const Text('这个人就是 章周'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('原来如此')),
            TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('实至名归')),
          ],
        ),
    );
  }

  // 显示SnackBar
  void showAppSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('干得漂亮'),
          action: SnackBarAction(
            label: '关闭',
            onPressed: () {},
          ),
          duration: const Duration(seconds: 3),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -20),
            blurRadius: 30,
          ),
        ],
      ),
      child:  Center(
        child: TextButton(
          child: const Text('谁是世界上最帅的男人？'),
          onPressed: () async {
            // 显示对话框
            final result = await showAppAlertDialog(context);
            if(result != null && result) {
              showAppSnackBar(context);
            }
          },
        ),
      ),
    );
  }
}
