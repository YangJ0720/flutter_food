import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/home_model.dart';
import 'package:food/widget/home_banner.dart';
import 'package:food/widget/home_discount.dart';
import 'package:food/widget/home_discount_grid.dart';
import 'package:food/widget/home_exclusive_grid.dart';
import 'package:food/widget/home_grid_nav.dart';
import 'package:food/widget/home_list_tile.dart';
import 'package:food/widget/home_navigation.dart';
import 'package:food/widget/home_search_sliver.dart';
import 'package:food/widget/home_tab_bar.dart';
import 'package:food/widget/home_tab_view.dart';
import 'package:food/widget/load_view.dart';

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

  /// 用户位置信息
  String _address = '';

  void _onRequest() async {
    var url = '${NetworkConfig.HOST_URL}assets/home.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      Map<String, dynamic> data = json.decode(response.data)['data'];
      HomeModel model = HomeModel.fromJson(data);
      setState(() {
        _homeModel = model;
        _tabController = TabController(length: model.tab.length, vsync: this);
      });
    }
  }

  @override
  void initState() {
    _onRequest();

    /// 调用Native获取位置信息
    _methodChannel.setMethodCallHandler((MethodCall call) => Future(() {
          String method = call.method;
          if ("setLocation" == method && call.arguments is String) {
            setState(() => {_address = call.arguments});
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabController == null
          ? LoadView()
          : DefaultTabController(
              length: _homeModel.tab.length,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  HomeSearchSliver(_address),
                  HomeDiscount(url: _homeModel.discount),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      HomeBanner(banner: _homeModel.banner),
                      HomeNavigation(list: _homeModel.navigation)
                    ]),
                  ),

                  /// 网格导航
                  HomeGridNav(numColumns: 5, list: _homeModel.gridNav),

                  /// 优惠专区
                  HomeListTile(
                    title: '优惠专区',
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                  ),
                  HomeDiscountGrid(list: _homeModel.discountGrid),

                  /// 专属优惠
                  HomeListTile(
                    title: '专属·午后时光',
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  ),
                  HomeExclusiveGrid(list: _homeModel.exclusiveGrid),

                  /// 广告轮播图
                  SliverToBoxAdapter(
                    child: HomeBanner(banner: _homeModel.ad),
                  ),

                  /// 选项卡
                  HomeTabBar(
                    list: _homeModel.tab,
                    tabController: _tabController,
                  )
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