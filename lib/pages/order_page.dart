import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/order_model.dart';
import 'package:food/ui/order_list.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/load_view.dart';
import 'package:food/widget/network_error_view.dart';

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
  var _futureBuilderFuture;

  void _changedOpacity(double opacity) {
    setState(() => _opacity = opacity);
  }

  Widget _createAppBar() {
    return AppBar(
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
    );
  }

  Future<List<OrderModel>> _loadData() async {
    var url = '${NetworkConfig.HOST_URL}assets/order/order.json';
    try {
      Response response = await Dio().get(url);
      if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
        List<dynamic> data = json.decode(response.data)['data'];
        List<OrderModel> list =
            data.map((i) => OrderModel.fromJson(i)).toList();
        return list;
      }
    } catch (e) {
      print('e = $e');
    }
    return null;
  }

  void _retry() {
    _futureBuilderFuture = _loadData();
  }

  @override
  void initState() {
    super.initState();
    _retry();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        var state = snapshot.connectionState;
        if (ConnectionState.waiting == state) {
          return LoadView();
        } else if (snapshot.hasData) {
          List<OrderModel> list = snapshot.data;
          return Scaffold(
            appBar: _createAppBar(),
            body: OrderList(list, _changedOpacity),
          );
        } else {
          return NetworkErrorView(valueChanged: (int value) {
            setState(() => _retry());
          });
        }
      },
      future: _futureBuilderFuture,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
