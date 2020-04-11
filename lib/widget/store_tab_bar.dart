import 'package:flutter/material.dart';

class StoreTabBar extends StatefulWidget {
  final List<String> tabs;

  StoreTabBar(this.tabs);

  @override
  State<StatefulWidget> createState() {
    return StoreTabBarState();
  }
}

class StoreTabBarState extends State<StoreTabBar> {
  List<Widget> _createTabBar() {
    List<Tab> tabs = List();
    List<String> list = widget.tabs;
    list.forEach((i) => tabs.add(Tab(child: Text(i))));
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _StoreTabBarSliver(
          TabBar(
            tabs: _createTabBar(),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.5,
          ),
        ),
        pinned: true);
  }
}

class _StoreTabBarSliver extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _StoreTabBarSliver(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: _tabBar, color: Colors.white);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
