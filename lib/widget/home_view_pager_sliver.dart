import 'package:flutter/material.dart';

class HomeViewPagerSliver extends SliverPersistentHeaderDelegate {
  final TabBar child;

  HomeViewPagerSliver({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child.tabs.length == 0 ? Container() : child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
