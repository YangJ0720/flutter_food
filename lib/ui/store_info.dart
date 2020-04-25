import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/home_tab_view_model.dart';
import 'package:food/model/store_info_model.dart';
import 'package:food/widget/load_view.dart';
import 'package:food/ui/store_info_summary.dart';
import 'package:food/ui/store_search_sliver.dart';
import 'package:food/ui/store_tab_bar.dart';
import 'package:food/ui/store_tab_view_brand.dart';
import 'package:food/ui/store_tab_view_evaluation.dart';
import 'package:food/ui/store_tab_view_order.dart';

/// 商铺信息
class StoreInfo extends StatefulWidget {
  final HomeTabViewModel model;

  StoreInfo(this.model);

  @override
  State<StatefulWidget> createState() {
    return StoreInfoState();
  }
}

class StoreInfoState extends State<StoreInfo> {
  StoreInfoModel _storeInfoModel;

  Future<Null> _onRequest() async {
    var url =
        '${NetworkConfig.HOST_URL}assets/store/details/1/store_details.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      Map<String, dynamic> map = json.decode(response.data)['data'];
      var model = StoreInfoModel.fromJson(map);
      setState(() => {_storeInfoModel = model});
    }
  }

  @override
  void initState() {
    _onRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _storeInfoModel == null
          ? LoadView()
          : SafeArea(
              child: NotificationListener(
                child: DefaultTabController(
                  length: _storeInfoModel.tab.length,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      StoreSearchSliver(imageUrl: _storeInfoModel.background),
                      SliverToBoxAdapter(
                          child:
                              StoreInfoSummary(widget.model, _storeInfoModel)),
                      StoreTabBar(_storeInfoModel.tab)
                    ],
                    body: TabBarView(
                      children: [
                        StoreTabViewOrder(),
                        StoreTabViewEvaluation(),
                        StoreTabViewBrand()
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
