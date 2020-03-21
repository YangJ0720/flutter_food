import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/browser/simple_browser.dart';
import 'package:food/model/home_navigation_model.dart';

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
    return GestureDetector(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            width: 50,
            height: 50,
            imageUrl: model.url,
          ),
          Text(model.label),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return SimpleBrowser(model.label, model.url);
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _item(context),
    );
  }
}
