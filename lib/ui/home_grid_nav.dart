import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_grid_nav_model.dart';
import 'package:food/ui/undone_show.dart';
import 'package:food/utils/route_utils.dart';

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
    TextStyle style = TextStyle(color: Colors.black87, fontSize: 11);
    widget.list.forEach((i) {
      list.add(GestureDetector(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(imageUrl: i.url, width: 25, height: 25),
            Text(i.label, style: style)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        onTap: () => RouteUtils.launchUndone(context, i.label),
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid.count(
        crossAxisCount: widget.numColumns,
        children: _createItem(),
        childAspectRatio: 1.5,
        mainAxisSpacing: 10,
      ),
    );
  }
}
