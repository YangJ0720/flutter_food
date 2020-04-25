import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/ui/undone_show.dart';
import 'package:food/widget/expand_number.dart';
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

  Widget _createTab(String text, Color color) {
    return GestureDetector(
      child: Container(
        child: Text(text, style: TextStyle(color: Colors.white)),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 5, right: 5),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return UndoneShow('商品评价');
        }));
      },
    );
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
                        child: Text('味道好，挺实惠的，份量也大。招牌黄焖鸡 + 土豆 + 鱼豆腐 + 青菜（配饭）'))
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text('主要原料: 鸡肉'),
                        Text('价格说明'),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '商品评价(好评率95%)',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text('10条评价'),
                                  Image.asset('images/ble.png',
                                      width: 15, height: 15),
                                ],
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Wrap(
                            children: <Widget>[
                              _createTab('全部 10', Color(0xFF4695F7)),
                              _createTab('最新', Color(0xFFEDF5FE)),
                              _createTab('好评 9', Color(0xFFEDF5FE)),
                              _createTab('差评 1', Color(0xFFF5F5F5)),
                              _createTab('有图 3', Color(0xFFEDF5FE)),
                            ],
                            crossAxisAlignment: WrapCrossAlignment.center,
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
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

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  var padding = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              Image.asset('images/aeg.jpg', fit: BoxFit.cover),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Image.asset('images/aj5.png'), onPressed: null),
                  IconButton(
                    icon: Image.asset('images/aj2.png'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
              )
            ],
            fit: StackFit.expand,
          )),
          Container(
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
            height: 80,
            padding: EdgeInsets.all(5),
          )
        ],
      ),
      color: Colors.white,
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 120 + padding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
