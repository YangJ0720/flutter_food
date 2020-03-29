class HomeDiscountGridModel {
  final int id;
  final String url;

  HomeDiscountGridModel(this.id, this.url);

  factory HomeDiscountGridModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String url = json['url'];
    return HomeDiscountGridModel(id, url);
  }
}
