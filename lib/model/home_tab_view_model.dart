class HomeTabViewModel {

  static const int TYPE_NORMAL = 0;
  static const int TYPE_NEW = 1;
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
  final int starting_price;

  /// 配送费
  final double delivery_fee;

  /// 是否为蜂鸟专送
  final bool professional_delivery;

  /// 商品配送抵达时间
  final String arrival_time;

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
      this.starting_price,
      this.delivery_fee,
      this.professional_delivery,
      this.arrival_time,
      this.distance,
      this.summary,
      this.labels);

  factory HomeTabViewModel.fromJson(Map<String, dynamic> map) {
    var type = map['type'];
    var icon = map['icon'];
    var name = map['name'];
    var star = map['star'];
    var sales = map['sales'];
    var starting_price = map['starting_price'];
    var delivery_fee = map['delivery_fee'];
    var professional_delivery = map['professional_delivery'];
    var arrival_time = map['arrival_time'];
    var distance = map['distance'];
    var summary = map['summary'];
    var labels = map['labels'];
    return HomeTabViewModel(
        type,
        icon,
        name,
        star,
        sales,
        starting_price,
        delivery_fee,
        professional_delivery,
        arrival_time,
        distance,
        summary,
        labels);
  }
}
