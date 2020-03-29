import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/model/home_discount_grid_model.dart';

class HomeDiscountGrid extends StatelessWidget {
  final String title;
  final List<HomeDiscountGridModel> list;

  const HomeDiscountGrid({Key key, this.title, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      childAspectRatio: 1.5,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              ClipRRect(
                child:
                    CachedNetworkImage(fit: BoxFit.fill, imageUrl: list[0].url),
                borderRadius: BorderRadius.circular(5),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(list[0].label, style: TextStyle(color: Colors.white)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 238, 112, 57),
                        Color.fromARGB(255, 236, 80, 51)
                      ]),
                    ),
                    padding:
                        EdgeInsets.only(left: 15, top: 2, right: 15, bottom: 2),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('下午餐9.9起', style: style),
                            Text('14点场', style: TextStyle(fontSize: 12)),
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
          margin: EdgeInsets.only(left: 10),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              ClipRRect(
                child:
                    CachedNetworkImage(fit: BoxFit.fill, imageUrl: list[1].url),
                borderRadius: BorderRadius.circular(5),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(list[1].label, style: TextStyle(color: Colors.white)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 108, 197, 250),
                        Color.fromARGB(255, 97, 173, 248)
                      ]),
                    ),
                    padding:
                        EdgeInsets.only(left: 15, top: 2, right: 15, bottom: 2),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('配送费0元起', style: style),
                            Text('实惠安心送到家', style: TextStyle(fontSize: 12)),
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
          margin: EdgeInsets.only(right: 10),
        )
      ],
    );
  }
}
