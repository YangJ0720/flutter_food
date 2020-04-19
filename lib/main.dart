import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:food/home.dart';
import 'package:food/ui/store_info.dart';
import 'package:food/ui/system_settings.dart';
import 'package:food/ui/user_info.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State {
  /// 当前是否为Flutter开发
  final bool isDev = false;

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}

  @override
  void initState() {
    super.initState();
    FlutterBoost.singleton.registerPageBuilders(
      {
        'home': (pageName, param, _) => Home(),
        'system_settings': (pageName, param, _) => SystemSettings(),
        'user_info': (pageName, param, _) => UserInfo('images/a1c.png'),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hybrid',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: isDev ? Home() : Container(color: Colors.white),
    );
  }
}
