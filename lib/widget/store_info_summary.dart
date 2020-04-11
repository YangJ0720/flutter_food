import 'package:flutter/material.dart';
import 'package:food/model/home_tab_view_model.dart';

class StoreInfoSummary extends StatefulWidget {
  final HomeTabViewModel model;

  StoreInfoSummary(this.model);

  @override
  State<StatefulWidget> createState() {
    return StoreInfoSummaryState();
  }
}

class StoreInfoSummaryState extends State<StoreInfoSummary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 30, 50, 10),
      child: Column(children: <Widget>[
        Text(
          widget.model.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('评价${widget.model.star}'),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('月售${widget.model.sales}'),
            ),
            Text('蜂鸟${widget.model.professional_delivery ? '专' : '快'}送')
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('¥8'),
                    Row(
                      children: <Widget>[
                        Image.asset('images/ai7.png', width: 20, height: 10),
                        Text('无门槛')
                      ],
                    ),
                    Text('领取'),
                  ],
                ),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.amberAccent,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '0.8折起抵用券',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '购买',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.deepOrange,
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
