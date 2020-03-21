import 'package:flutter/material.dart';
import 'package:food/model/home_tab_model.dart';
import 'package:food/widget/load_view.dart';

import 'home_view_pager_sliver.dart';

class HomeTabBar extends StatefulWidget {
  final List<HomeTabModel> list;
  final TabController tabController;

  HomeTabBar({this.list, this.tabController});

  @override
  State<StatefulWidget> createState() {
    return HomeTabBarState();
  }
}

class HomeTabBarState extends State<HomeTabBar> {
  bool _isEmpty() {
    return widget.list == null || widget.list.length == 0;
  }

  List<Widget> _createTab() {
    if (_isEmpty()) {
      return [];
    } else {
      List<Widget> tabs = List();
      List<HomeTabModel> list = widget.list;
      list.forEach((i) => {tabs.add(_createTabContent(i))});
      return tabs;
    }
  }

  Widget _createTabContent(HomeTabModel model) {
    return Container(
      child: Center(child: Text(model.label)),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: HomeViewPagerSliver(
        child: TabBar(
            tabs: _createTab(),
            controller: widget.tabController,
            labelColor: Colors.black),
      ),
      pinned: true,
    );
  }
}
