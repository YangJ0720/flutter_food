import 'package:flutter/material.dart';
import 'package:food/utils/route_utils.dart';

class StoreOrderSummarySliver extends StatelessWidget {
  Widget _createTab(BuildContext context, String text, Color color) {
    return GestureDetector(
      child: Container(
        child: Text(text, style: TextStyle(color: Colors.white)),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 5, right: 5),
      ),
      onTap: () => RouteUtils.launchUndone(context, '商品评价'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text('主要原料: 鸡肉', style: TextStyle(fontSize: 12)),
            Text('价格说明', style: TextStyle(fontSize: 12)),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    '商品评价(好评率95%)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('10条评价'),
                      Image.asset('images/ble.png', width: 15, height: 15),
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Wrap(
                children: <Widget>[
                  _createTab(context, '全部 10', Color(0xFF4695F7)),
                  _createTab(context, '最新', Color(0xFFEDF5FE)),
                  _createTab(context, '好评 9', Color(0xFFEDF5FE)),
                  _createTab(context, '差评 1', Color(0xFFF5F5F5)),
                  _createTab(context, '有图 3', Color(0xFFEDF5FE)),
                ],
                crossAxisAlignment: WrapCrossAlignment.center,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
