import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/ui/product_card.dart';
import 'package:food/ui/product_list_view.dart';
import 'package:food/ui/product_sidebar.dart';
import 'package:food/widget/shopping_cart.dart';
import 'package:food/widget/simple_banner_view.dart';

/// 商家详情 -> 点餐
class StoreTabViewOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderState();
  }
}

class StoreTabViewOrderState extends State<StoreTabViewOrder>
    with AutomaticKeepAliveClientMixin {
  double _price = 0;
  var _futureBuilderFuture;

  /// 请求点餐列表数据
  Future<StoreInfoShoppingModel> _loadData() async {
    var url = '${NetworkConfig.HOST_URL}assets/store/tab/tab_shopping.json';
    try {
      Response response = await Dio().get(url);
      if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
        Map<String, dynamic> map = json.decode(response.data)['data'];
        var model = StoreInfoShoppingModel.fromJson(map);
        return model;
      }
    } catch (e) {
      print('e = $e');
    }
    return null;
  }

  void _changedPrice(double price) {
    setState(() {
      _price = double.tryParse((_price + price).toStringAsFixed(2));
    });
  }

  Widget _createContentView(StoreInfoShoppingModel model) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              SimpleBannerView(list: _convertBannerList(model.banner)),
              Container(
                child: Text(
                  model.recommend.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(10),
              ),
              Container(
                child: ProductCard(model.recommend.list, (price) {
                  _changedPrice(price);
                }),
                height: 230,
              ),
              _createListView(model)
            ],
          )),
          ShoppingCart(price: _price)
        ],
      ),
      color: Colors.white,
    );
  }

  List<String> _convertBannerList(List<StoreInfoBannerModel> banner) {
    List<String> list = List();
    banner.forEach((i) => list.add(i.url));
    return list;
  }

  Widget _createListView(StoreInfoShoppingModel model) {
    return Row(
      children: <Widget>[
        Container(child: ProductSidebar(model.sidebar), width: 100),
        Expanded(
          child: Container(
            child: ProductListView(model.list, (price) {
              _changedPrice(price);
            }),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  void initState() {
    super.initState();
    _futureBuilderFuture = _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _price = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          StoreInfoShoppingModel model = snapshot.data;
          return _createContentView(model);
        }
        return Container();
      },
      future: _futureBuilderFuture,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
