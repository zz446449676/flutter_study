import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

// 使用 ChangeNotifierProxyProvider 是因为 需要用Provider提供一个AppService类
// 然而AppService 类依赖AuthModel类，所以需要使用ChangeNotifierProxyProvider，来解决这种依赖问题
// AuthModel为所依赖的类， AppService为需要提供的类
final appServiceProvider = ChangeNotifierProxyProvider<AuthModel, AppService>(
    create: (context) => AppService(authModel: context.read<AuthModel>()),
    update: (context, authModel, appService) => AppService(authModel: authModel),
);

final appProviders = [
  appServiceProvider,
];