import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_tab_model.dart';

class HomeTabBarDelegate extends SliverPersistentHeaderDelegate {
  final List<HomeTabModel> tab;
  final TabController tabController;

  double _height;

  HomeTabBarDelegate({this.tab, this.tabController});

  List<Widget> _createTabBar() {
    List<Widget> tabs = List();
    List<HomeTabModel> list = tab;
    list.forEach((i) => {tabs.add(Tab(text: i.label))});
    return tabs;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    TabBar tabBar = TabBar(tabs: _createTabBar());
    _height = tabBar.preferredSize.height;
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
