import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_exclusive_grid_model.dart';
import 'package:food/ui/undone_show.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/wrap_cache_image.dart';

class HomeExclusiveGrid extends StatelessWidget {
  final String title;
  final List<HomeExclusiveGridModel> list;

  const HomeExclusiveGrid({Key key, this.title, this.list}) : super(key: key);

  Widget _createItem(BuildContext context, HomeExclusiveGridModel model,
      EdgeInsets margin, TextStyle style) {
    BorderRadius borderRadius = BorderRadius.circular(5);
    return GestureDetector(
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              child: WrapCacheImage(url: model.url),
              borderRadius: borderRadius,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(model.label, style: style),
                          Text('实惠安心送到家',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 237, 120, 47))),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(245, 238, 238, 238),
                      borderRadius: borderRadius),
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            )
          ],
          fit: StackFit.expand,
        ),
        margin: margin,
      ),
      onTap: () => RouteUtils.launchUndone(context, model.label),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      childAspectRatio: 1.5,
      mainAxisSpacing: 5,
      children: <Widget>[
        _createItem(context, list[0], EdgeInsets.only(left: 10), style),
        _createItem(context, list[1], EdgeInsets.only(right: 10), style),
        _createItem(context, list[2], EdgeInsets.only(left: 10), style),
        _createItem(context, list[3], EdgeInsets.only(right: 10), style),
      ],
    );
  }
}
