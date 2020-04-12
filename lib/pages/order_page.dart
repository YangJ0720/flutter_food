import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/widget/wrap_cache_image.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State with AutomaticKeepAliveClientMixin {
  static const double SCROLL_DISTANCE = 50;
  double _opacity = 0;

  void _onScroll(double pixels) {
    var value = pixels / SCROLL_DISTANCE;
    if (value > 1) {
      value = 1;
    }
    setState(() {
      _opacity = value;
    });
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  String _getDateFormat(String dateTime) {
    var index = dateTime.lastIndexOf('.');
    return dateTime.substring(0, index);
  }

  Widget _createItemView(int index) {
    return Card(
        child: Padding(
      child: Row(
        children: <Widget>[
          Container(
            child: WrapCacheImage(
              url: NetworkConfig.HOST_URL +
                  "images/list/1WxbpSGTA-RTs8wYnQe71l0gkVM!MA.jpg",
              width: 40,
              height: 40,
            ),
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('陈记麻辣香锅'),
                        Image.asset('images/ble.png', width: 15, height: 15)
                      ],
                    ),
                    Text('已取消')
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      Text(_getDateFormat(DateTime.now().toString())),
                      Text(
                        '您主动取消',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Divider(height: 20),
                Row(
                  children: <Widget>[Text('牛肉等13件'), Text('¥38.6')],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                ButtonBar(
                  children: <Widget>[
                    OutlineButton(
                        onPressed: () => {print('click')}, child: Text('送祝福')),
                    OutlineButton(
                        onPressed: () => {print('click')}, child: Text('再来一单')),
                  ],
                )
              ],
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.all(10),
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text('其他订单', style: TextStyle(color: Colors.black)),
            ),
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Opacity(
          opacity: _opacity,
          child: Text(
            '我的订单',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
      body: RefreshIndicator(
          child: NotificationListener(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '我的订单',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Image.asset('images/ahh.png', width: 20, height: 20)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return _createItemView(index);
                  },
                  childCount: 10,
                )),
              ],
            ),
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                _onScroll(notification.metrics.pixels);
              }
              return false;
            },
          ),
          onRefresh: _onRefresh),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
