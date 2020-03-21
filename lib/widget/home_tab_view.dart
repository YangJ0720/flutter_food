import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/model/home_tab_model.dart';
import 'package:food/model/home_tab_view_model.dart';

class HomeTabView extends StatefulWidget {
  final List<HomeTabModel> list;
  final TabController tabController;

  HomeTabView({this.list, this.tabController});

  @override
  State<StatefulWidget> createState() {
    return HomeTabViewState();
  }
}

class HomeTabViewState extends State<HomeTabView> {
  bool _isEmpty() {
    List<HomeTabModel> list = widget.list;
    return list == null || list.isEmpty;
  }

  List<Widget> _createTabView() {
    if (_isEmpty()) {
      return List<Widget>();
    }
    List<HomeTabModel> list = widget.list;
    List<Widget> tabViews = List();
    list.forEach((i) => tabViews.add(_createTabContent(i)));
    return tabViews;
  }

  Widget _createTabContent(HomeTabModel model) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(title: Text('${model.label} -> $index'));
      },
      itemCount: 100,
    );
  }

  @override
  void initState() {
//    if (!_isEmpty()) {
//      var id = widget.list[widget.tabController.index].id;
//      rootBundle.loadString('assets/home/$id/tab.json').then((value) {
//        Map<String, dynamic> map = json.decode(value);
//        List<dynamic> data = map['data'];
//        List<HomeTabViewModel> list =
//            data.map((i) => HomeTabViewModel.fromJson(i)).toList();
//        print('list.length = ${list.length}');
//        print('list = $list');
//      });
//    }
    print('initState');
    rootBundle.loadString('assets/home/1/tab.json').then((value) {
      Map<String, dynamic> map = json.decode(value);
      List<dynamic> data = map['data'];
      List<HomeTabViewModel> list =
          data.map((i) => HomeTabViewModel.fromJson(i)).toList();
      print('list.length = ${list.length}');
      print('list = $list');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: _createTabView(), controller: widget.tabController);
  }
}
