class HomeDiscountGridModel {
  final int id;
  final String label;
  final String url;

  HomeDiscountGridModel(this.id, this.label, this.url);

  factory HomeDiscountGridModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String label = json['label'];
    String url = json['url'];
    return HomeDiscountGridModel(id, label, url);
  }
}
