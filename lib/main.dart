import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:food/config/build_config.dart';
import 'package:food/home.dart';
import 'package:food/model/home_tab_view_model.dart';
import 'package:food/ui/location_info.dart';
import 'package:food/ui/search_info.dart';
import 'package:food/ui/store_info.dart';
import 'package:food/ui/store_tab_view_order_details.dart';
import 'package:food/ui/system_settings.dart';
import 'package:food/ui/transport_map.dart';
import 'package:food/ui/user_info.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State {
  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}

  @override
  void initState() {
    super.initState();
    FlutterBoost.singleton.registerPageBuilders(
      {
        'sample://home': (pageName, param, _) => Home(),
        'sample://system_settings': (pageName, param, _) {
          var value = param['key'];
          print('pageName = $pageName, value = $value');
          return SystemSettings();
        },
        'sample://user_info': (pageName, param, _) {
          var path = param['path'];
          return UserInfo(path: path);
        },
        'sample://store_info': (pageName, param, _) {
          var mapModel = jsonDecode(param['HomeTabViewModel']);
          var model = HomeTabViewModel.fromJson(mapModel);
          return StoreInfo(model);
        },
        'sample://product_info': (pageName, param, _) =>
            StoreTabViewOrderDetails(),
        'sample://transport_map': (pageName, param, _) => TransportMap(),
        'sample://search_info': (pageName, param, _) => SearchInfo(),
        'sample://location_info': (pageName, param, _) {
          var address = param['address'];
          return LocationInfo(address: address);
        },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hybrid',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: BuildConfig.isDev ? Home() : Container(),
    );
  }
}
