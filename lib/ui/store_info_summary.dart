import 'package:flutter/material.dart';
import 'package:food/model/home_tab_view_model.dart';
import 'package:food/model/store_info_model.dart';

class StoreInfoSummary extends StatefulWidget {
  final HomeTabViewModel model;
  final StoreInfoModel _storeInfoModel;

  StoreInfoSummary(this.model, this._storeInfoModel);

  @override
  State<StatefulWidget> createState() {
    return StoreInfoSummaryState();
  }
}

class StoreInfoSummaryState extends State<StoreInfoSummary> {
  Widget _createView(
      StoreInfoCouponModel coupon, String left, String right, Color color) {
    var style = TextStyle(color: color, fontSize: 12);
    return Expanded(
        child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                Text('¥${coupon.price}', style: style),
                Text(coupon.label, style: style)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(left), fit: BoxFit.fill)),
            padding: EdgeInsets.all(4),
          ),
        ),
        Container(
          child: Text(coupon.operate, style: style),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(right), fit: BoxFit.fill)),
          padding: EdgeInsets.all(4),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 12);
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
            Text('评价${widget.model.star}', style: style),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('月售${widget.model.sales}', style: style),
            ),
            Text('蜂鸟${widget.model.professional_delivery ? '专' : '快'}送',
                style: style)
          ],
        ),
        Row(
          children: <Widget>[
            _createView(widget._storeInfoModel.coupon[0], 'images/alt.png',
                'images/alu.png', Colors.black),
            Container(width: 20),
            _createView(widget._storeInfoModel.coupon[1], 'images/alp.png',
                'images/alr.png', Colors.white)
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            widget._storeInfoModel.announcement,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        )
      ]),
    );
  }
}
