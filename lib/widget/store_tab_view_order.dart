import 'package:flutter/material.dart';

/// 商家详情 -> 点餐
class StoreTabViewOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderState();
  }
}

class StoreTabViewOrderState extends State<StoreTabViewOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('商家推荐'),
        SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.amberAccent,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.orange,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.pink,
                width: 200,
                height: 200,
              )
            ],
          ),
          scrollDirection: Axis.horizontal,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'));
          },
          itemCount: 100,
        ))
      ],
    );
  }
}
