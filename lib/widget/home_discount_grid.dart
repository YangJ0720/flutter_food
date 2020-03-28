import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeDiscountGrid extends StatelessWidget {
  final String title;

  const HomeDiscountGrid({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return SliverToBoxAdapter(
//      child: Container(
//        child: Column(
//          children: <Widget>[
//            Text(title),
//            SliverGrid.count(
//              crossAxisCount: 2,
//              children: <Widget>[
//                Container(color: Colors.pink, height: 200),
//                Container(color: Colors.orange, height: 200),
//              ],
//            )
//          ],
//        ),
//        margin: EdgeInsets.only(left: 5, right: 5),
//      ),
//    );
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 50,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(5),
            ),
          width: 50,
          height: 50,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
