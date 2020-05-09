import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(color: Colors.transparent, height: _paddingTop),
          left: 0,
          top: 0,
          right: 0,
        ),
        Positioned(
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
                    padding: EdgeInsets.all(10),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
              ClipOval(
                child: Container(
                  child: Image.asset(
                    'images/am2.png',
                    width: 20,
                    height: 20,
                  ),
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          left: 0,
          top: _paddingTop,
          right: 0,
        )
      ],
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
