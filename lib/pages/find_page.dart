import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    rootBundle.loadString('assets/find.json').then((value) {
      Map<String, dynamic> map = json.decode(value);
      List<dynamic> data = map['data'] as List;
      List<FindModel> list = data.map((i) => FindModel.fromJson(i)).toList();
      setState(() {
        _tabs = list;
        _tabController = TabController(length: list.length, vsync: this);
        _tabController.addListener(_addListener);
      });
    });
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
