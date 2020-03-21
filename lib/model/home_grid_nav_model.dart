/// 首页 -> 网格导航
class HomeGridNavModel {
  final String icon;
  final String label;

  HomeGridNavModel(this.icon, this.label);

  factory HomeGridNavModel.fromJson(Map<String, dynamic> json) {
    String icon = json['icon'];
    String label = json['label'];
    return HomeGridNavModel(icon, label);
  }
}
