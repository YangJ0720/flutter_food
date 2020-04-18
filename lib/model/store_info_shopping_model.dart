import 'package:flutter/cupertino.dart';

/// 商铺详情 -> 点餐选项卡
class StoreInfoShoppingModel {
  final List<StoreInfoBannerModel> banner;
  final StoreInfoRecommendModel recommend;
  final List<StoreInfoSidebarModel> sidebar;
  final List<StoreInfoListModel> list;

  StoreInfoShoppingModel(this.banner, this.recommend, this.sidebar, this.list);

  factory StoreInfoShoppingModel.fromJson(Map<String, dynamic> json) {
    /// 商铺详情界面 -> 点餐选项卡 -> 广告轮播
    List<dynamic> bannerJson = json['banner'];
    var banner =
        bannerJson.map((i) => StoreInfoBannerModel.fromJson(i)).toList();

    /// 商铺详情界面 -> 点餐选项卡 ->
    var recommendJson = json['recommend'];
    var recommend = StoreInfoRecommendModel.fromJson(recommendJson);

    /// 商铺详情界面 -> 点餐选项卡 -> 左侧快速导航
    List<dynamic> sidebarJson = json['sidebar'];
    var sidebar =
        sidebarJson.map((i) => StoreInfoSidebarModel.fromJson(i)).toList();

    /// 商铺详情界面 -> 点餐选项卡 -> 商品列表
    List<dynamic> listJson = json['list'];
    var list = listJson.map((i) => StoreInfoListModel.fromJson(i)).toList();
    return StoreInfoShoppingModel(banner, recommend, sidebar, list);
  }
}

/// 商铺详情 -> 点餐选项卡 -> 广告轮播
class StoreInfoBannerModel {
  final String url;

  StoreInfoBannerModel(this.url);

  factory StoreInfoBannerModel.fromJson(Map<String, dynamic> map) {
    var url = map['url'];
    return StoreInfoBannerModel(url);
  }
}

/// 商铺详情 -> 点餐选项卡 -> 商家推荐
class StoreInfoRecommendModel {
  final String title;
  final List<StoreInfoRecommendSubModel> list;

  StoreInfoRecommendModel(this.title, this.list);

  factory StoreInfoRecommendModel.fromJson(Map<String, dynamic> map) {
    var title = map['title'];
    var listJson = map['list'] as List;
    var list =
        listJson.map((i) => StoreInfoRecommendSubModel.fromJson(i)).toList();
    return StoreInfoRecommendModel(title, list);
  }
}

class StoreInfoRecommendSubModel {
  final String imageUrl;
  final String name;
  final String shipments;
  final double price;

  StoreInfoRecommendSubModel(
      this.imageUrl, this.name, this.shipments, this.price);

  factory StoreInfoRecommendSubModel.fromJson(Map<String, dynamic> map) {
    var imageUrl = map['imageUrl'];
    var name = map['name'];
    var shipments = map['shipments'];
    var price = map['price'];
    return StoreInfoRecommendSubModel(imageUrl, name, shipments, price);
  }
}

/// 商铺详情 -> 点餐选项卡 -> 左侧快速导航
class StoreInfoSidebarModel {
  final String imageUrl;
  final String name;

  StoreInfoSidebarModel(this.imageUrl, this.name);

  factory StoreInfoSidebarModel.fromJson(Map<String, dynamic> map) {
    var imageUrl = map['imageUrl'];
    var name = map['name'];
    return StoreInfoSidebarModel(imageUrl, name);
  }
}

/// 商铺详情 -> 点餐选项卡 -> 商品列表
class StoreInfoListModel {
  final String imageUrl;
  final String name;
  final String summary;
  final String shipments;
  final double price;
  final int type;

  StoreInfoListModel(this.imageUrl, this.name, this.summary, this.shipments,
      this.price, this.type);

  factory StoreInfoListModel.fromJson(Map<String, dynamic> map) {
    var imageUrl = map['imageUrl'];
    var name = map['name'];
    var summary = map['summary'];
    var shipments = map['shipments'];
    var price = map['price'];
    var type = map['type'];
    return StoreInfoListModel(imageUrl, name, summary, shipments, price, type);
  }
}
