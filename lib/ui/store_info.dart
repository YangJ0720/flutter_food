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
import 'package:food/widget/network_error_view.dart';

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
  var _futureBuilderFuture;

  Future<StoreInfoModel> _loadData() async {
    var url =
        '${NetworkConfig.HOST_URL}assets/store/details/1/store_details.json';
    try {
      Response response = await Dio().get(url);
      if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
        Map<String, dynamic> map = json.decode(response.data)['data'];
        var model = StoreInfoModel.fromJson(map);
        return model;
      }
    } catch (e) {
      print('e = $e');
    }
    return null;
  }

  Widget _createView(StoreInfoModel model) {
    return NotificationListener(
      child: DefaultTabController(
        length: model.tab.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            StoreSearchSliver(imageUrl: model.background),
            SliverToBoxAdapter(
              child: StoreInfoSummary(widget.model, model),
            ),
            StoreTabBar(model.tab)
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
    );
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (ConnectionState.waiting == state) {
            return LoadView();
          } else if (snapshot.hasData) {
            StoreInfoModel model = snapshot.data;
            return _createView(model);
          }
          return NetworkErrorView(valueChanged: (int value) {
            setState(() => _retry());
          });
        },
        future: _futureBuilderFuture,
      ),
    );
  }
}
