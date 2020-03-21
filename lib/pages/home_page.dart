import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/model/home_model.dart';
import 'package:food/widget/home_banner.dart';
import 'package:food/widget/home_grid_nav.dart';
import 'package:food/widget/home_navigation.dart';
import 'package:food/widget/home_search_sliver.dart';
import 'package:food/widget/home_tab_bar.dart';
import 'package:food/widget/home_tab_view.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ///
  TabController _tabController;

  /// MethodChannel
  final MethodChannel _methodChannel = MethodChannel('method_channel');

  ///
  HomeModel _homeModel = HomeModel();

  /// 标题栏透明度
  double _alpha = 1;

  /// 用户位置信息
  String _address = '';

  void _onScroll(double pixels) {
    double value = pixels / 50;
    if (value > 1) {
      value = 1;
    }
    setState(() {
      _alpha = 1 - value;
    });
  }

  void getHttp() async {
    Response response = await Dio().get(
        'https://github.com/YangJ0720/flutter_food/blob/master/assets/find.json?raw=true');
    print('response = $response');
    int code = response.statusCode;
    print('code = $code');
    dynamic data = response.data;
    print('data = $data');
  }

  @override
  void initState() {
    getHttp();
    rootBundle.loadString('assets/home.json').then((value) {
      Map<String, dynamic> map = json.decode(value);
      HomeModel model = HomeModel.fromJson(map['data']);
      setState(() {
        _homeModel = model;
        _tabController = TabController(length: model.tab.length, vsync: this);
      });
    });

    /// 调用Native获取位置信息
    _methodChannel.setMethodCallHandler((MethodCall call) => Future(() {
          String method = call.method;
          if ("setLocation" == method) {
            if (call.arguments is String) {
              setState(() {
                _address = call.arguments;
              });
            }
          }
          return call.toString();
        }));
    _methodChannel.invokeMethod('getLocation');
    super.initState();
  }

  @override
  void dispose() {
    _methodChannel.setMethodCallHandler(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification &&
            notification.depth == 0) {
          _onScroll(notification.metrics.pixels);
        }
        return false;
      },
      child: DefaultTabController(
        length: _homeModel.tab == null ? 0 : _homeModel.tab.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              delegate: HomeSearchSliver(_alpha, _address),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                HomeBanner(banner: _homeModel.banner),
                HomeNavigation(list: _homeModel.navigation)
              ]),
            ),
            HomeGridNav(numColumns: 5, list: _homeModel.gridNav),
            HomeTabBar(
              list: _homeModel.tab,
              tabController: _tabController,
            ),
          ],
          body: HomeTabView(
            list: _homeModel.tab,
            tabController: _tabController,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
