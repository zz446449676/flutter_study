import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';
import 'index/post_index_model.dart';

// 将每个模块需要提供的provider单独以文件的形式保存和提供，便于分类管理和维护
final postShowProvider = ChangeNotifierProvider<PostShowModel>(
create: (context) => PostShowModel()
);

final postIndexProvider = ChangeNotifierProxyProvider<AppService, PostIndexModel >(
  create: (context) => PostIndexModel(appService: context.read<AppService>()),
  update: (context, appService, postIndexModel) {
    return PostIndexModel(appService: appService, posts: postIndexModel?.posts, layout: postIndexModel?.layout);
  },
);
final postProviders = [
  postShowProvider,
  postIndexProvider,
];