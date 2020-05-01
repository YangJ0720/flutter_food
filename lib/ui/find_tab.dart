import 'package:flutter/material.dart';
import 'package:food/model/find_model.dart';

class FindTab extends StatelessWidget {
  final List<FindModel> _list;
  final TabController _tabController;

  const FindTab(this._list, this._tabController);

  List<Widget> _create() {
    List<Widget> list = List<Widget>();
    _list.forEach((i) => {list.add(Text(i.label))});
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: _create(),
      controller: _tabController,
      isScrollable: true,
    );
  }
}
