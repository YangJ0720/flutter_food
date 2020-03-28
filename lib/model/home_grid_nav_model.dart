/// 首页 -> 网格导航
class HomeGridNavModel {
  final String url;
  final String label;

  HomeGridNavModel(this.url, this.label);

  factory HomeGridNavModel.fromJson(Map<String, dynamic> json) {
    String url = json['url'];
    String label = json['label'];
    return HomeGridNavModel(url, label);
  }
}
