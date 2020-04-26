import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/config/network_config.dart';
import 'package:food/ui/store_order_search_sliver.dart';
import 'package:food/ui/store_order_summary_sliver.dart';
import 'package:food/widget/shopping_cart.dart';
import 'package:food/widget/wrap_cache_image.dart';

/// 商家详情 -> 点餐 -> 商品详情
class StoreTabViewOrderDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderDetailsState();
  }
}

class StoreTabViewOrderDetailsState extends State<StoreTabViewOrderDetails> {
  String _getDateFormat(String dateTime) {
    var index = dateTime.lastIndexOf('.');
    return dateTime.substring(0, index);
  }

  Widget _createItemView(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: WrapCacheImage(
                url: NetworkConfig.HOST_URL +
                    "images/list/1WxbpSGTA-RTs8wYnQe71l0gkVM!MA.jpg",
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('T**********v'),
                            Image.asset('images/a0l.png', width: 50, height: 20)
                          ],
                        ),
                        Text('赞了该商品', style: TextStyle(fontSize: 10))
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Text(
                      _getDateFormat(DateTime.now().toString()),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '味道好，挺实惠的，份量也大。招牌黄焖鸡 + 土豆 + 鱼豆腐 + 青菜（配饭）',
                      style: TextStyle(fontSize: 14),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: WrapCacheImage(
                          url: NetworkConfig.HOST_URL +
                              "images/details/2H5V6mUqDGKzLU1_UukbmQcztjc!MA.jpg",
                        ),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: WrapCacheImage(
                          url: NetworkConfig.HOST_URL +
                              "images/details/2H5V6mUqDGKzLU1_UukbmQcztjc!MA.jpg",
                        ),
                        height: 150,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  void _updateStatusBarBrightness() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _updateStatusBarBrightness();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                StoreOrderSearchSliver(),
                StoreOrderSummarySliver(),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return _createItemView(index);
                  },
                  childCount: 30,
                )),
              ],
            ),
          ),
          ShoppingCart()
        ],
      ),
    );
  }
}
