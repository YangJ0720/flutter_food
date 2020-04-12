import 'dart:ui';

import 'package:flutter/material.dart';

class StoreTabViewOrderDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderDetailsState();
  }
}

class StoreTabViewOrderDetailsState extends State<StoreTabViewOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: _SliverPersistentHeaderDelegate(),
                  pinned: true,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return ListTile(title: Text('index = $index'));
                  },
                  childCount: 30,
                )),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Image.asset('images/a3n.png', width: 50, height: 50),
                FlatButton(
                  onPressed: () => {print('')},
                  child: Text('¥20起送'),
                  color: Colors.black54,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            color: Colors.grey,
            height: 50,
            padding: EdgeInsets.only(left: 5, right: 5),
          )
        ],
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  var padding = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                Image.asset('images/aeg.jpg', fit: BoxFit.cover)
              ],
              fit: StackFit.expand,
            )),
            Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '招牌黄焖鸡 + 土豆 + 鱼豆腐',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('月售314   好评率95%', style: TextStyle(fontSize: 10)),
                      Row(
                        children: <Widget>[
                          Text(
                            '¥42.8',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                          Image.asset('images/a2i.png', width: 20, height: 20)
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
              height: 80,
              padding: EdgeInsets.all(5),
            )
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 100 + padding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
