import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/home.dart';
import 'package:food/model/order_model.dart';
import 'package:food/ui/order_list.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/load_view.dart';

/// 订单
class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State with AutomaticKeepAliveClientMixin {
  double _opacity = 0;
  List<OrderModel> _list;

  void _changedJumpToPage(int index) {}

  void _changedOpacity(double opacity) {
    setState(() {
      _opacity = opacity;
    });
  }

  Future<Null> _requestData() async {
    var url = '${NetworkConfig.HOST_URL}assets/order/order.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      List<dynamic> data = json.decode(response.data)['data'];
      List<OrderModel> list = data.map((i) => OrderModel.fromJson(i)).toList();
      setState(() {
        if (_list == null) {
          _list = list;
        } else {
          _list.addAll(list);
        }
      });
    }
  }

  @override
  void initState() {
    _requestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_list == null) {
      return LoadView();
    }
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            onPressed: () => RouteUtils.launchUndone(context, '其他订单'),
            child: Text('其他订单'),
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
      body: OrderList(_list, _changedOpacity),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
