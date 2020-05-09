import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/widget/expand_number.dart';
import 'package:food/widget/wrap_cache_image.dart';

class StoreOrderSearchSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverPersistentHeaderDelegate(),
      pinned: true,
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  static const double MIN_EXTENT = 150;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Container(
          child: WrapCacheImage(
            url: '${NetworkConfig.HOST_URL}images/a05.jpg',
            fit: BoxFit.cover,
          ),
          height: maxExtent,
        ),
        Positioned(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Image.asset(
                    'images/aj5.png',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: null),
              IconButton(
                icon: Image.asset(
                  'images/aj2.png',
                  width: 40,
                  height: 40,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          top: MediaQuery.of(context).padding.top,
          right: 0,
        ),
        Positioned(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  '招牌黄焖鸡 + 土豆 + 鱼豆腐',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('月售314   好评率95%', style: TextStyle(fontSize: 10)),
                Row(
                  children: <Widget>[
                    Text(
                      '¥42.8',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    ExpandNumber(model: StoreInfoGeneric(42.8))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: Colors.white,
            height: 80,
            padding: EdgeInsets.all(5),
          ),
          left: 0,
          right: 0,
          bottom: 0,
        )
      ],
      fit: StackFit.expand,
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => MIN_EXTENT;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
