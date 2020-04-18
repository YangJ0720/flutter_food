import 'package:flutter/material.dart';

/// 点餐 -> 购物车
class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset('images/a3n.png', width: 50, height: 50),
          FlatButton(
            onPressed: () => {print('')},
            child: Text('¥20起送'),
            color: Colors.black54,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      color: Color(0xFFBEBEBE),
      height: 50,
      padding: EdgeInsets.only(left: 5, right: 5),
    );
  }
}
