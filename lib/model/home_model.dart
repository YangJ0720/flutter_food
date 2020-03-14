import 'home_navigation_model.dart';

/// 首页
class HomeModel {
  final List<String> banner;
  final List<HomeNavigationModel> navigation;

  HomeModel(this.banner, this.navigation);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    /// 轮播图
    List<dynamic> list = json['banner'];
    List<String> urls = list.map((i) => i['url'].toString()).toList();

    /// 快捷导航
    List<dynamic> nav = json['navigation'];
    List<HomeNavigationModel> navigation =
        nav.map((i) => HomeNavigationModel.fromJson(i)).toList();
    return HomeModel(urls, navigation);
  }
}
