import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 订单界面数据为空
class OrderEmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(child: Image.asset('images/ain.png'), flex: 1),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('没有找到订单'),
                ),
                OutlineButton(
                  onPressed: () {},
                  child: Text('立即下单'),
                )
              ],
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
