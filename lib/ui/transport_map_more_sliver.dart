import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';

class TransportMapMoreSliver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransportMapMoreSliverState();
  }
}

class TransportMapMoreSliverState extends State<TransportMapMoreSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverPersistentHeaderDelegate(),
      pinned: true,
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: ClipOval(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/beb.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        color: Colors.grey,
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    onTap: () => FlutterBoost.singleton.closeByContext(context),
                  ),
                  ClipOval(
                    child: Container(
                      child:
                          Image.asset('images/am2.png', width: 20, height: 20),
                      color: Colors.grey,
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          left: 0,
          top: 0,
          right: 0,
        ),
      ],
      fit: StackFit.expand,
    );
  }

  @override
  double get maxExtent => 600;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
