/// 首页 -> 快捷导航
class HomeNavigationModel {
  final String url;
  final String label;

  HomeNavigationModel([this.url, this.label]);

  factory HomeNavigationModel.fromJson(Map<String, dynamic> json) {
    String url = json['url'];
    String label = json['label'];
    return HomeNavigationModel(url, label);
  }
}
