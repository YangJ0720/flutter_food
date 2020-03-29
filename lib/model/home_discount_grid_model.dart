class HomeDiscountGridModel {
  final int id;
  final String label;
  final String title;
  final String subTitle;
  final String url;
  final int type;

  HomeDiscountGridModel(
      this.id, this.label, this.title, this.subTitle, this.url, this.type);

  factory HomeDiscountGridModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String label = json['label'];
    String title = json['title'];
    String subTitle = json['subTitle'];
    String url = json['url'];
    int type = json['type'];
    return HomeDiscountGridModel(id, label, title, subTitle, url, type);
  }
}
