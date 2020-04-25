import 'dart:convert';

class HomeTabViewModel {
  /// 店铺类型: 普通
  static const int TYPE_NORMAL = 0;

  /// 店铺类型: 新店
  static const int TYPE_NEW = 1;

  /// 店铺类型: 品牌
  static const int TYPE_BRAND = 2;

  /// 店铺类型（0：普通，1：新店，2：品牌）
  final int type;

  /// 商品图片
  final String icon;

  /// 商品名称
  final String name;

  /// 商品评分
  final double star;

  /// 商品销量
  final int sales;

  /// 起送价格
  final int startingPrice;

  /// 配送费
  final double deliveryFee;

  /// 是否为蜂鸟专送
  final bool professionalDelivery;

  /// 商品配送抵达时间
  final String arrivalTime;

  /// 距离
  final String distance;

  /// 商品摘要
  final String summary;

  /// 标签
  final List<dynamic> labels;

  HomeTabViewModel(
      this.type,
      this.icon,
      this.name,
      this.star,
      this.sales,
      this.startingPrice,
      this.deliveryFee,
      this.professionalDelivery,
      this.arrivalTime,
      this.distance,
      this.summary,
      this.labels);

  factory HomeTabViewModel.fromJson(Map<String, dynamic> map) {
    var type = map['type'];
    var icon = map['icon'];
    var name = map['name'];
    var star = map['star'];
    var sales = map['sales'];
    var startingPrice = map['starting_price'];
    var deliveryFee = map['delivery_fee'];
    var professionalDelivery = map['professional_delivery'];
    var arrivalTime = map['arrival_time'];
    var distance = map['distance'];
    var summary = map['summary'];
    var labels = map['labels'];
    return HomeTabViewModel(
        type,
        icon,
        name,
        star,
        sales,
        startingPrice,
        deliveryFee,
        professionalDelivery,
        arrivalTime,
        distance,
        summary,
        labels);
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'icon': icon,
        'name': name,
        'star': star,
        'sales': sales,
        'starting_price': startingPrice,
        'delivery_fee': deliveryFee,
        'professional_delivery': professionalDelivery,
        'arrival_time': arrivalTime,
        'distance': distance,
        'summary': summary,
        'labels': labels
      };
}
