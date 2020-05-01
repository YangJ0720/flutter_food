import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/model/find_model.dart';
import 'package:food/ui/find_tab.dart';
import 'package:food/ui/find_tab_view.dart';
import 'package:food/widget/load_view.dart';

/// 发现
class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FindState();
  }
}

class FindState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<FindModel> _tabs;
  TabController _tabController;

  _addListener() {
    if (_tabController.animation.value == _tabController.index) {
      print('index = ${_tabController.index}');
    }
  }

  void _onRequest() async {
    var url = '${NetworkConfig.HOST_URL}assets/find.json';
    Response response = await Dio().get(url);
    if (NetworkConfig.RESPONSE_SUCCESS == response.statusCode) {
      List<dynamic> data = json.decode(response.data)['data'];
      List<FindModel> list = data.map((i) => FindModel.fromJson(i)).toList();
      setState(() {
        if (_tabs == null) {
          _tabs = list;
        } else {
          _tabs.addAll(list);
        }
        _tabController = TabController(length: list.length, vsync: this);
        _tabController.addListener(_addListener);
      });
    }
  }

  @override
  void initState() {
    _onRequest();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_addListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_tabs == null) {
      return LoadView();
    }
    return Scaffold(
      appBar: AppBar(title: FindTab(_tabs, _tabController)),
      body: FindTabView(_tabs, _tabController),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
