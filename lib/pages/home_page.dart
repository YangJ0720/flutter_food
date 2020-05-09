import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/home_model.dart';
import 'package:food/ui/home_discount.dart';
import 'package:food/ui/home_discount_grid.dart';
import 'package:food/ui/home_exclusive_grid.dart';
import 'package:food/ui/home_grid_nav.dart';
import 'package:food/ui/home_list_tile.dart';
import 'package:food/ui/home_navigation.dart';
import 'package:food/ui/home_search_sliver.dart';
import 'package:food/ui/home_tab_bar.dart';
import 'package:food/ui/home_tab_view.dart';
import 'package:food/widget/load_view.dart';
import 'package:food/widget/network_error_view.dart';
import 'package:food/widget/simple_banner_view.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  /// 选项卡控制器
  TabController _tabController;

  /// MethodChannel
  MethodChannel _methodChannel;

  /// 用户位置信息
  String _address = '';

  var _futureBuilderFuture;

  Future<HomeModel> _loadData() async {
    var url = '${NetworkConfig.HOST_URL}assets/home/home.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      Map<String, dynamic> data = json.decode(response.data)['data'];
      HomeModel model = HomeModel.fromJson(data);

      ///
      _tabController = TabController(length: model.tab.length, vsync: this);
      return model;
    }
    return null;
  }

  Widget _createBody(HomeModel model) {
    return DefaultTabController(
      length: model.tab.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          HomeSearchSliver(_address),
          HomeDiscount(url: model.discount),
          SliverList(
            delegate: SliverChildListDelegate([
              SimpleBannerView(list: model.banner),
              HomeNavigation(list: model.navigation)
            ]),
          ),

          /// 网格导航
          HomeGridNav(numColumns: 5, list: model.gridNav),

          /// 优惠专区
          HomeListTile(
            title: '优惠专区',
            padding: EdgeInsets.only(left: 10, bottom: 10),
          ),
          HomeDiscountGrid(list: model.discountGrid),

          /// 专属优惠
          HomeListTile(
            title: '专属·午后时光',
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          ),
          HomeExclusiveGrid(list: model.exclusiveGrid),

          /// 广告轮播图
          SliverToBoxAdapter(child: SimpleBannerView(list: model.ad)),

          /// 选项卡
          HomeTabBar(list: model.tab, tabController: _tabController)
        ],
        body: HomeTabView(list: model.tab, tabController: _tabController),
      ),
    );
  }

  @override
  void initState() {
    _futureBuilderFuture = _loadData();

    /// 调用Native获取位置信息
    _methodChannel = MethodChannel('method_channel');
    _methodChannel.setMethodCallHandler((MethodCall call) {
      return Future(() {
        String method = call.method;
        if ("setLocation" == method && call.arguments is String) {
          setState(() => _address = call.arguments);
        }
        return call.toString();
      });
    });
    _methodChannel.invokeMethod('getLocation');
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _methodChannel.setMethodCallHandler(null);
    _methodChannel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (ConnectionState.waiting == state) {
            return LoadView();
          } else if (snapshot.hasData) {
            HomeModel model = snapshot.data;
            return _createBody(model);
          } else {
            return NetworkErrorView();
          }
        },
        future: _futureBuilderFuture,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
