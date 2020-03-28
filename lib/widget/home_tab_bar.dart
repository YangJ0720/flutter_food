import 'package:flutter/material.dart';
import 'package:food/model/home_tab_model.dart';
import 'package:food/widget/load_view.dart';

import 'home_view_pager_sliver.dart';

class HomeTabBar extends StatelessWidget {
  final List<HomeTabModel> list;
  final TabController tabController;

  HomeTabBar({this.list, this.tabController});

  List<Widget> _createTab() {
    List<Widget> tabs = List();
    list.forEach((i) => {tabs.add(Tab(text: i.label))});
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: HomeViewPagerSliver(
        child: TabBar(
          tabs: _createTab(),
          controller: tabController,
          isScrollable: true,
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      pinned: true,
    );
  }
}
