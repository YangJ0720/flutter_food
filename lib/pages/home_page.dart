import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/model/home_model.dart';
import 'package:food/model/home_navigation_model.dart';
import 'package:food/widget/home_banner.dart';
import 'package:food/widget/home_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State with AutomaticKeepAliveClientMixin {
  /// Banner轮播图数据
  final List<String> _banner = List<String>();

  /// 快捷导航
  final List<HomeNavigationModel> _navigation = List<HomeNavigationModel>();

  /// 标题栏透明度
  double _alpha = 0;

  /// 利用滑动的像素值控制标题栏的透明度
  void _onScroll(double pixels) {
    double value = pixels / 100;
    if (value > 1) {
      value = 1;
    }
    setState(() {
      _alpha = value;
    });
  }

  @override
  void initState() {
    rootBundle.loadString('assets/home.json').then((value) {
      Map<String, dynamic> map = json.decode(value);
      HomeModel model = HomeModel.fromJson(map);
      setState(() {
        _banner.addAll(model.banner);
        _navigation.addAll(model.navigation);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification &&
                notification.depth == 0) {
              _onScroll(notification.metrics.pixels);
            }
            return false;
          },
          child: ListView(
            children: <Widget>[
              HomeBanner(_banner),
              HomeNavigation(_navigation),
              Container(
                child: Text('data'),
                height: 800,
              ),
              Text('bottom'),
            ],
          ),
        ),
        Opacity(
          opacity: _alpha,
          child: Container(
            height: 80,
            alignment: Alignment.center,
            color: Colors.white,
            child: Center(
              child: Text(
                '首页',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
