import 'dart:ui';

import 'package:flutter/material.dart';

class HomeSearchSliver extends SliverPersistentHeaderDelegate {
  final double _padding = MediaQueryData.fromWindow(window).padding.top;

  final double _minExtent = 50;

  final double _alpha;
  final String _address;

  HomeSearchSliver(this._alpha, this._address);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Opacity(
              opacity: _alpha,
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Image.asset('images/ajk.png'),
                      width: 30,
                      height: 30),
                  Expanded(
                    child: Text(_address,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(Icons.settings, color: Colors.grey)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(Icons.sms, color: Colors.grey))
                ],
              ),
            ),
            color: Colors.white,
          )),
          Container(
            height: _minExtent,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: FlatButton(
              onPressed: () {
                print('click');
              },
              color: Color(0xFFF0F0F0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search, color: Colors.grey),
                  Text('海底捞', style: TextStyle(color: Colors.grey))
                ],
              ),
              shape: StadiumBorder(
                  side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => _minExtent + _padding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
