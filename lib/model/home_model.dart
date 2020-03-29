import 'package:food/model/home_grid_nav_model.dart';
import 'package:food/model/home_tab_model.dart';

import 'home_discount_grid_model.dart';
import 'home_navigation_model.dart';

/// 首页
class HomeModel {
  String discount;
  List<String> banner = List();
  List<HomeNavigationModel> navigation = List();
  List<HomeGridNavModel> gridNav = List();
  List<HomeDiscountGridModel> discountGrid = List();
  List<String> ad = List();
  List<HomeTabModel> tab = List();

  HomeModel(
      [this.discount,
      this.banner,
      this.navigation,
      this.gridNav,
      this.discountGrid,
      this.ad,
      this.tab]);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    /// 优惠活动
    String discount = json['discount'];

    /// 轮播图
    List<dynamic> list = json['banner'];
    List<String> urls = list.map((i) => i['url'].toString()).toList();

    /// 快捷导航
    List<dynamic> nav = json['navigation'];
    List<HomeNavigationModel> navigation =
        nav.map((i) => HomeNavigationModel.fromJson(i)).toList();

    /// 网格导航
    List<dynamic> gridNavJson = json['gridNavigation'];
    List<HomeGridNavModel> gridNav =
        gridNavJson.map((i) => HomeGridNavModel.fromJson(i)).toList();

    /// 优惠专区
    List<dynamic> discountGridJson = json['discountGrid'];
    List<HomeDiscountGridModel> discountGrid =
        discountGridJson.map((i) => HomeDiscountGridModel.fromJson(i)).toList();

    /// 广告轮播图
    List<dynamic> adList = json['ad'];
    List<String> ad = adList.map((i) => i['url'].toString()).toList();

    /// 选项卡
    List<dynamic> tabsJson = json['tabs'];
    List<HomeTabModel> tabs =
        tabsJson.map((i) => HomeTabModel.fromJson(i)).toList();
    return HomeModel(
        discount, urls, navigation, gridNav, discountGrid, ad, tabs);
  }
}
