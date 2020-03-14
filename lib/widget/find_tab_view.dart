import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food/model/find_model.dart';

class FindTabView extends StatelessWidget {
  final List<FindModel> _list;
  final TabController _tabController;

  const FindTabView(this._list, this._tabController);

  List<Widget> _create() {
    if (_list == null) {
      return [];
    }
    List<Widget> list = List<Widget>();
    _list.forEach((i) => {list.add(_createContentView())});
    return list;
  }

  Widget _createContentView() {
    return StaggeredGridView.countBuilder(
        controller: ScrollController(),
        itemCount: 100,
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemBuilder: (context, index) => Container(
              color: Colors.pink,
              child: Center(
                child: Text('$index'),
              ),
            ),
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index % 2 == 0 ? 2 : 1));
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? Center(
            child: Text('正在加载数据'),
          )
        : TabBarView(
            children: _create(),
            controller: _tabController,
          );
  }
}
