import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/widget/home_search_sliver.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print('initState -> OrderPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(delegate: HomeSearchSliver(1, ''), pinned: true),
        SliverFillRemaining(
          child: Container(
            height: 800,
            child: Center(child: Text('data')),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.blue, Colors.lightBlue])),
        ),
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Center(
                child: Text('data'),
              )
            ],
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.pink),
        )
      ],
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 50 + MediaQueryData.fromWindow(window).padding.top;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
