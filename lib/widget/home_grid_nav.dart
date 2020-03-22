import 'package:flutter/material.dart';
import 'package:food/model/home_grid_nav_model.dart';

/// 首页 -> 网格导航
class HomeGridNav extends StatefulWidget {
  final int numColumns;
  final List<HomeGridNavModel> list;

  const HomeGridNav({Key key, this.numColumns, this.list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeGridNavState();
  }
}

class HomeGridNavState extends State<HomeGridNav> {
  List<Widget> _createItem() {
    List<Widget> list = List();
    if (widget.list != null && widget.list.isNotEmpty) {
      widget.list.forEach((i) {
        list.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Icon(Icons.home), Text(i.label)],
        ));
      });
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: widget.numColumns,
      children: _createItem(),
    );
  }
}
