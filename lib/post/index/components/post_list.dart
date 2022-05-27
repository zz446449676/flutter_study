import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    // 获取到的Post是一组内容
    final model = context.watch<PostIndexModel>();

    // 如果 posts 为空，则赋值为[]
    final posts = model.posts ?? [];

    // 当没有内容时，显示的小部件
    final noContent = Center(
      child: Container(
        child: Text('暂无内容'),
      ),
    );

    // 当有内容时，使用ListView构建列表视图将内容显示出来
    final list = ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Text(
          // 最后的！是说明这个参数不可能为空
          posts[index].content!,
          style: Theme.of(context).textTheme.headline6,
        );
      },
    );

    model.posts?.forEach((element) {
      print(element.toJson());
    });

    return posts.length == 0 ? noContent : list;
  }

  @override
  void initState() {
    super.initState();

    // 创建一个微任务
    Future.microtask(() {
      context.read<PostIndexModel>().getPosts();
    });
  }
}
