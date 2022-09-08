import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/create/post_create_model.dart';

class PostCreateMedia extends StatefulWidget {
  const PostCreateMedia({Key? key}) : super(key: key);

  @override
  State<PostCreateMedia> createState() => _PostCreateMediaState();
}

class _PostCreateMediaState extends State<PostCreateMedia> {
  @override
  Widget build(BuildContext context) {
    final postCreateModel = context.read<PostCreateModel>();

    // 定义一个选择文件的方法
    selectFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        print('所选文件 ：${result.files.first}');
        postCreateModel.setSelectedFiled(result.files.first);
      }
    }

    // 添加一个纵横比为3比2的图片占位widget
    final imagePlaceHolder = AspectRatio(
      aspectRatio: 3/2,
      child: Container (
        // 给容器添加装饰，例如圆角颜色等等
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Icon(
          Icons.add_a_photo_outlined,
          size: 56,
          color: Colors.black12,
        ),
      ),
    );

    // 创建一个可点击 InkWell 它是一个矩形区域可响应用户点击触摸的widget，里面可设置点击效果
    final imagePlaceholderMask = Positioned.fill(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.deepPurpleAccent.withOpacity(0.3),
        onTap: postCreateModel.loading ? null : selectFile,
      ),
    );

    // 当用户选择完文件后，把文件进行展示出来
    final selectedImage = postCreateModel.selectedFile != null ?
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          File(
            postCreateModel.selectedFile!.path!,
          ),
        ),
      ) : null;

    // 上传内容时的进度指示器
    final indicator = postCreateModel.loading ?
      const CircularProgressIndicator(
        // 设置描边
        strokeWidth: 2,
      ) : null;

    return Container(
      // 垂直方向添加对称的24的内边距
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Stack(
        // 对齐方式居中
        alignment: Alignment.center,
        children: [
          // 注意： 因为stack 是一个栈结构 所以 imagePlaceholderMask要放在 imagePlaceHolder的下面，才能触发点击效果
          imagePlaceHolder,
          if (selectedImage != null) selectedImage,
          imagePlaceholderMask,
          if (indicator != null) indicator,
        ],
      ),
    );
  }
}
