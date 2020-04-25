import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/browser/simple_browser.dart';
import 'package:food/model/home_navigation_model.dart';
import 'package:food/utils/route_utils.dart';

/// 首页 -> 快捷导航
class HomeNavigation extends StatelessWidget {
  final List<HomeNavigationModel> list;

  const HomeNavigation({Key key, this.list}) : super(key: key);

  List<Widget> _item(BuildContext context) {
    if (list == null) {
      return List();
    }
    List<Widget> item = List();
    list.forEach((i) => item.add(_create(context, i)));
    return item;
  }

  Widget _create(BuildContext context, HomeNavigationModel model) {
    TextStyle style = TextStyle(fontSize: 11, color: Colors.black87);
    return GestureDetector(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(width: 50, height: 50, imageUrl: model.url),
          Text(model.label, style: style),
        ],
      ),
      onTap: () => RouteUtils.launchWeb(context, model.label, model.url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _item(context),
      ),
    );
  }
}
