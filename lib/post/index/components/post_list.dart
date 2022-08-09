import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/post/index/components/post_list_item.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key, this.sort}) : super(key: key);

  final String? sort;
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
    final stackList = ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostListItem(item: posts[index]);
      },
    );

    final gridList = GridView.builder(
        itemCount: posts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return PostListItem(
              item: posts[index],
              layout: PostListLayout.grid,
          );
        },
    );

    model.posts?.forEach((element) {
      print(element.toJson());
    });

    // 声名一个Widget，默认为stackList
    Widget postList = stackList;

    if (model.layout == PostListLayout.grid) {
      postList = gridList;
    }

    return posts.length == 0 ? noContent : postList;
  }

  // 从SP中读取布局并且设置布局
  restoreLayout() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('postListLayout');

    if (data != null) {
      PostListLayout layout = PostListLayout.values.firstWhere((element) => element.toString() == data);
      context.read<PostIndexModel>().setLayout(layout);
    }
  }

  @override
  void initState() {
    super.initState();

    // 创建一个微任务
    Future.microtask(() {
      context.read<PostIndexModel>().getPosts(sort: widget.sort ?? 'latest');
    });

    // 恢复布局
    restoreLayout();
  }
}
