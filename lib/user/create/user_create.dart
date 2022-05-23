import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCreate extends StatefulWidget {
  const UserCreate({Key? key}) : super(key: key);

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  String? name;
  String? password;

  final nameFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();

  final nameFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  //Form表单，把需要验证的数据加入到一个表单中进行统一验证, 需要在最外层warp一个Form部件
  final formKey = GlobalKey<FormState>();

  // 当 Flutter 从构建树中移除这个小部件时，会执行diepose方法，用于释放一些资源，保存数据等
  @override
  void dispose() {
    super.dispose();

    nameFieldController.dispose();
    passwordFieldController.dispose();
  }

  // 初始化小部件时，会执行
  @override
  void initState() {
    super.initState();

    nameFieldController.addListener(() {
      print('用户 Controller ： ${nameFieldController.text}');
    });

    passwordFieldController.addListener(() {
      print('密码 Controller : ${passwordFieldController.text}');
    });

    // nameFieldController.text = 'zhang';
    // passwordFieldController.text = '123456';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '注册用户',
            style: TextStyle(
              fontSize: 32,
              // 设置文字粗细
              fontWeight: FontWeight.w300,
            ),
          ),

          // 用sizebox增加间隙
          const SizedBox(height: 32,),

          TextFormField(
            key: nameFieldKey,
            // 添加文本编辑控制器，可以用于对文本添加监听等功能
            controller: nameFieldController,
            decoration: const InputDecoration(labelText: '用户'),
            onChanged: (value) {
              name = value;
            },
            // 验证用户数据
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请填写用户名';
              }
              return null;
            },
          ),
          const SizedBox(height: 32,),

          TextFormField(
            key: passwordFieldKey,
            controller: passwordFieldController,
            obscureText: true,
            decoration: const InputDecoration(labelText: '密码'),
            onChanged: (value) {
              password = value;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return '请设置6位以上的密码';
              }
              return null;
            },
          ),
          const SizedBox(height: 32,),

          ElevatedButton(
            onPressed: () {
              // nameFieldKey.currentState!.validate();
              // passwordFieldKey.currentState!.validate();
              formKey.currentState!.validate();
              print('用户 : ${nameFieldKey.currentState!.value} , 密码 ： ${passwordFieldKey.currentState!.value}');
            },
            child: const Text('注册用户'),
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 18),
              minimumSize: const Size(double.infinity, 60),
            ),
          ),
        ],
      ),
    );
  }
}
