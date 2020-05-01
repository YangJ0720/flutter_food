import 'package:flutter/material.dart';
import 'package:food/model/find_model.dart';
import 'package:food/ui/find_tab_view_waterfall.dart';
import 'package:food/widget/load_view.dart';

/// 发现 -> TabBarView
class FindTabView extends StatefulWidget {
  final List<FindModel> _list;
  final TabController _tabController;

  const FindTabView(this._list, this._tabController);

  @override
  State<StatefulWidget> createState() {
    return FindTabViewState();
  }
}

class FindTabViewState extends State<FindTabView> {
  List<Widget> _create() {
    List<Widget> list = List<Widget>();
    widget._list.forEach((i) => {list.add(_createContentView(i))});
    return list;
  }

  Widget _createContentView(FindModel model) {
    return FindTabViewWaterfall(model: model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: TabBarView(children: _create(), controller: widget._tabController),
    );
  }
}
