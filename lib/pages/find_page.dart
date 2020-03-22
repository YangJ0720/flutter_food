import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/model/find_model.dart';
import 'package:food/widget/find_tab.dart';
import 'package:food/widget/find_tab_view.dart';

/// 发现
class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FindState();
  }
}

class FindState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<FindModel> _tabs = List();
  TabController _tabController;

  _addListener() {
    if (_tabController.animation.value == _tabController.index) {
      print('index = ${_tabController.index}');
    }
  }

  void _onRequest() async {
    var url =
        'https://gitee.com/YangJ0720/flutter_takeout/raw/af5f2602bd92d9b82a9f304b1252efd2332c4e7f/flutter_takeout/assets/find.json';
    Response response = await Dio().get(url);
    if (200 == response.statusCode) {
      List<dynamic> data = json.decode(response.data)['data'];
      List<FindModel> list = data.map((i) => FindModel.fromJson(i)).toList();
      setState(() {
        _tabs = list;
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
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: FindTab(_tabs, _tabController)),
      body: FindTabView(_tabs, _tabController),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_addListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
