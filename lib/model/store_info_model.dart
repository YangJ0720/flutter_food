/// 商铺详情
class StoreInfoModel {
  final String background;
  final List<StoreInfoCouponModel> coupon;
  final String announcement;
  final List<StoreInfoTabModel> tab;

  StoreInfoModel(this.background, this.coupon, this.announcement, this.tab);

  factory StoreInfoModel.fromJson(Map<String, dynamic> json) {
    /// 商铺详情界面背景图片
    var background = json['background'];

    /// 商铺详情界面优惠券
    List<dynamic> coupons = json['coupon'];
    var coupon = coupons.map((i) => StoreInfoCouponModel.fromJson(i)).toList();

    /// 商铺详情界面介绍
    var announcement = json['announcement'];

    /// 商铺详情界面选项卡
    List<dynamic> tabsJson = json['tabs'];
    var tabs = tabsJson.map((i) => StoreInfoTabModel.fromJson(i)).toList();
    return StoreInfoModel(background, coupon, announcement, tabs);
  }
}

/// 商铺详情 -> 优惠券
class StoreInfoCouponModel {
  final int price;
  final String label;
  final String operate;
  final int type;

  StoreInfoCouponModel(this.price, this.label, this.operate, this.type);

  factory StoreInfoCouponModel.fromJson(Map<String, dynamic> map) {
    var price = map['price'];
    var label = map['label'];
    var operate = map['operate'];
    var type = map['type'];
    return StoreInfoCouponModel(price, label, operate, type);
  }
}

/// 商铺详情 -> 选项卡
class StoreInfoTabModel {
  final String name;

  StoreInfoTabModel(this.name);

  factory StoreInfoTabModel.fromJson(Map<String, dynamic> map) {
    var name = map['name'];
    return StoreInfoTabModel(name);
  }
}
