import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/ui/store_tab_view_order_details.dart';
import 'package:food/widget/shopping_cart.dart';
import 'package:food/widget/simple_banner_view.dart';
import 'package:food/widget/wrap_cache_image.dart';

/// 商家详情 -> 点餐
class StoreTabViewOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderState();
  }
}

class StoreTabViewOrderState extends State<StoreTabViewOrder> {
  int _selectorIndex = 0;
  StoreInfoShoppingModel _storeInfoShoppingModel;

  /// 商家推荐
  Widget _createCard(StoreInfoRecommendSubModel model) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: WrapCacheImage(url: model.imageUrl, width: 150, height: 150),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: <Widget>[
                  Text(model.name,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(model.shipments,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Row(
                    children: <Widget>[
                      Text(
                        '¥${model.price}',
                        style: TextStyle(color: Colors.red),
                      ),
                      Image.asset('images/a2i.png', width: 20, height: 20)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 0.5,
              offset: Offset(0, 1),
            )
          ],
          color: Colors.white),
      margin: EdgeInsets.all(5),
    );
  }

  /// 左侧商品选项卡
  List<Widget> _createSidebar() {
    List<Widget> list = List();
    _storeInfoShoppingModel.sidebar.asMap().forEach((k, v) {
      var item = GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: _createSidebarText(k, v),
          color: k == _selectorIndex ? Colors.white : Colors.transparent,
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        ),
        onTap: () => {setState(() => _selectorIndex = k)},
      );
      list.add(item);
    });
    return list;
  }

  Widget _createSidebarText(int i, StoreInfoSidebarModel model) {
    return model.imageUrl == null
        ? Text(model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: i == _selectorIndex
                ? TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)
                : TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12))
        : Row(
            children: <Widget>[
              Container(
                child:
                    WrapCacheImage(url: model.imageUrl, isPlaceholder: false),
                width: 10,
                height: 10,
              ),
              Text(model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: i == _selectorIndex
                      ? TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)
                      : TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12))
            ],
          );
  }

  /// 商品列表
  Widget _createItemView(StoreInfoListModel model) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: WrapCacheImage(url: model.imageUrl),
              borderRadius: BorderRadius.circular(2.5),
            ),
            width: 100,
            height: 100,
            margin: EdgeInsets.all(5),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(model.name,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(model.summary,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(model.shipments,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Row(
                    children: <Widget>[
                      Text('¥${model.price}',
                          style: TextStyle(color: Colors.red)),
                      Image.asset('images/a2i.png', width: 20, height: 20)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              height: 100,
              padding: EdgeInsets.only(right: 10),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return StoreTabViewOrderDetails();
        }));
      },
    );
  }

  void _onRequest() async {
    var url = '${NetworkConfig.HOST_URL}assets/store/tab/tab_shopping.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      Map<String, dynamic> map = json.decode(response.data)['data'];
      print('map = $map');
      var model = StoreInfoShoppingModel.fromJson(map);
      setState(() {
        _storeInfoShoppingModel = model;
      });
    }
  }

  @override
  void initState() {
    _onRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _storeInfoShoppingModel == null
        ? Container()
        : Container(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    _storeInfoShoppingModel.banner == null
                        ? Container()
                        : SimpleBannerView(),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _storeInfoShoppingModel.recommend.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      child: ListView.builder(
                        itemCount:
                            _storeInfoShoppingModel.recommend.list.length,
                        itemBuilder: (_, index) {
                          return _createCard(
                              _storeInfoShoppingModel.recommend.list[index]);
                        },
                        scrollDirection: Axis.horizontal,
                        itemExtent: 150,
                      ),
                      height: 230,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: ListView(
                            children: _createSidebar(),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                          color: Color(0xFFF8F8F8),
                          width: 100,
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemBuilder: (_, index) {
                                return _createItemView(
                                    _storeInfoShoppingModel.list[index]);
                              },
                              itemCount: _storeInfoShoppingModel.list.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                            ),
                            color: Colors.white,
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                )),
                ShoppingCart()
              ],
            ),
          );
  }
}
