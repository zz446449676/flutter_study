import 'package:flutter/material.dart';

// 当通过web地址栏进入postShwoMain内容页面时，因为没有所需post数据，所以会出现错误。
// 所以当没有数据时，需要自己请求服务端接口来获取
class AppNoContent extends StatelessWidget {
  const AppNoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('暂无内容'),
    );
  }
}
