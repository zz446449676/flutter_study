import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/post.dart';

class PostTags extends StatelessWidget {
  const PostTags({Key? key, required this.tags}) : super(key: key);
  final List<PostTag> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:
          // 下面的方法其实就相当于一个迭代器，遍历tags列表，并把里面的每一个元素都转换成一个Chip标签
          // 因为Row的children属性需要接收一个List参数，所以最后调用toList（），把遍历到的所有Chip转换成List交给Row
          tags.map((tag) {
            return Chip(label: Text(tag.name!));
          }).toList(),
      ),
    );
  }
}
