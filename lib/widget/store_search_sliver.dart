import 'dart:ui';

import 'package:flutter/material.dart';

class StoreSearchSliver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreSearchSliverState();
  }
}

class StoreSearchSliverState extends State<StoreSearchSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _StoreSearchDelegate(),
      pinned: true,
    );
  }
}

class _StoreSearchDelegate extends SliverPersistentHeaderDelegate {
  var paddingTop = MediaQueryData.fromWindow(window).padding.top;

  Color _makeStickyColorByIcon(double shrinkOffset) {
    if (shrinkOffset <= minExtent) {
      return Colors.white;
    }
    double offset = shrinkOffset / (maxExtent - minExtent);
    if (offset > 1) {
      offset = 1;
    }
    int alpha = (255 * offset).toInt();
    return Color.fromARGB(alpha, 0, 0, 0);
  }

  Color _makeStickyColorByBg(double shrinkOffset) {
    if (shrinkOffset <= minExtent) {
      return Colors.transparent;
    }
    double offset = shrinkOffset / (maxExtent - minExtent);
    if (offset > 1) {
      offset = 1;
    }
    int alpha = (255 * offset).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Widget _makeStickySearchWidget(double shrinkOffset) {
    return Expanded(
      child: shrinkOffset <= minExtent
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset('images/am2.png', width: 20, height: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset('images/am3.png', width: 20, height: 20),
                )
              ],
            )
          : Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: FlatButton(
                onPressed: () => {print('click')},
                color: Color(0xFFF0F0F0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child:
                          Image.asset('images/ahh.png', width: 15, height: 15),
                    ),
                    Text('想吃什么搜一搜', style: TextStyle(color: Colors.grey))
                  ],
                ),
                shape: StadiumBorder(
                    side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
              ),
            ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          child: Image.asset('images/aeg.jpg',
              height: maxExtent, fit: BoxFit.cover),
        ),
        Positioned(
            child: Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: _makeStickyColorByIcon(shrinkOffset),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  _makeStickySearchWidget(shrinkOffset),
                  IconButton(
                    icon: Image.asset(
                      'images/am5.png',
                      width: 20,
                      height: 20,
                      color: _makeStickyColorByIcon(shrinkOffset),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ],
              ),
              color: _makeStickyColorByBg(shrinkOffset),
              height: minExtent,
            ),
            top: 0,
            left: 0,
            right: 0)
      ],
      fit: StackFit.expand,
    ));
  }

  @override
  double get maxExtent => 200 + paddingTop;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
