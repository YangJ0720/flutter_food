import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/event/global_event.dart';
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
  StoreInfoShoppingModel _storeInfoShoppingModel;

  /// 请求点餐列表数据
  void _onRequest() async {
    var url = '${NetworkConfig.HOST_URL}assets/store/tab/tab_shopping.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      Map<String, dynamic> map = json.decode(response.data)['data'];
      var model = StoreInfoShoppingModel.fromJson(map);
      setState(() => {_storeInfoShoppingModel = model});
    }
  }

  Widget _createListView() {
    return Row(
      children: <Widget>[
        Container(
          child: ProductSidebar(_storeInfoShoppingModel.sidebar),
          width: 100,
        ),
        Expanded(
          child: Container(
            child: ProductListView(_storeInfoShoppingModel.list),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  void initState() {
    _onRequest();
    GlobalEvent.instance.eventBus.on<ProductPriceEvent>().listen((event) {
      setState(() {
        _price = double.tryParse((_price + event.price).toStringAsFixed(2));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    GlobalEvent.instance.eventBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    /// 正在加载数据
    if (_storeInfoShoppingModel == null) {
      return Container();
    }

    /// 数据加载完毕
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              _storeInfoShoppingModel.banner == null
                  ? Container()
                  : SimpleBannerView(),
              Container(
                child: Text(
                  _storeInfoShoppingModel.recommend.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(10),
              ),
              Container(
                child: ProductCard(_storeInfoShoppingModel.recommend.list),
                height: 230,
              ),
              _createListView()
            ],
          )),
          ShoppingCart(price: _price)
        ],
      ),
      color: Colors.white,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
