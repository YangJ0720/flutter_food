import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_discount_grid_model.dart';
import 'package:food/ui/undone_show.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/wrap_cache_image.dart';

class HomeDiscountGrid extends StatelessWidget {
  final String title;
  final List<HomeDiscountGridModel> list;

  const HomeDiscountGrid({Key key, this.title, this.list}) : super(key: key);

  Widget _createItem(BuildContext context, HomeDiscountGridModel model,
      EdgeInsets margin, LinearGradient gradient, TextStyle style) {
    return GestureDetector(
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              child: WrapCacheImage(url: model.url),
              borderRadius: BorderRadius.circular(5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child:
                      Text(model.label, style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    gradient: gradient,
                  ),
                  padding:
                      EdgeInsets.only(left: 15, top: 2, right: 15, bottom: 2),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(model.title, style: style),
                          Text(model.subTitle, style: TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color.fromARGB(220, 255, 255, 255)),
                  margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                )
              ],
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
      children: <Widget>[
        _createItem(
          context,
          list[0],
          EdgeInsets.only(left: 10),
          LinearGradient(colors: [
            Color.fromARGB(255, 238, 112, 57),
            Color.fromARGB(255, 236, 80, 51)
          ]),
          style,
        ),
        _createItem(
          context,
          list[1],
          EdgeInsets.only(right: 10),
          LinearGradient(colors: [
            Color.fromARGB(255, 108, 197, 250),
            Color.fromARGB(255, 97, 173, 248)
          ]),
          style,
        )
      ],
    );
  }
}
