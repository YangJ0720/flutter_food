import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_discount_grid_model.dart';

class HomeDiscountGrid extends StatelessWidget {
  final String title;
  final List<HomeDiscountGridModel> list;

  const HomeDiscountGrid({Key key, this.title, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      childAspectRatio: 1.5,
      children: <Widget>[
        Container(
          child: Stack(
            alignment: FractionalOffset(0.5, 0),
            children: <Widget>[
              ClipRRect(
                child:
                    CachedNetworkImage(fit: BoxFit.fill, imageUrl: list[0].url),
                borderRadius: BorderRadius.circular(5),
              ),
              Text('限时秒杀', style: TextStyle(backgroundColor: Colors.pink)),
            ],
          ),
          margin: EdgeInsets.only(left: 10),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.only(right: 10),
        )
      ],
    );
  }
}
