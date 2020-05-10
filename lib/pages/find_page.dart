import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/find_model.dart';
import 'package:food/ui/find_tab.dart';
import 'package:food/ui/find_tab_view.dart';
import 'package:food/widget/load_view.dart';
import 'package:food/widget/network_error_view.dart';

/// 发现
class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FindState();
  }
}

class FindState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  var _futureBuilderFuture;

  Future<List<FindModel>> _loadData() async {
    var url = '${NetworkConfig.HOST_URL}assets/find.json';
    try {
      Response response = await Dio().get(url);
      if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
        List<dynamic> data = json.decode(response.data)['data'];
        List<FindModel> list = data.map((i) => FindModel.fromJson(i)).toList();

        ///
        _tabController = TabController(length: list.length, vsync: this);
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          List<FindModel> list = snapshot.data;
          return Scaffold(
            appBar: AppBar(title: FindTab(list, _tabController)),
            body: FindTabView(list, _tabController),
          );
        }
        return NetworkErrorView(valueChanged: (int value) {
          setState(() => _retry());
        });
      },
      future: _futureBuilderFuture,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
