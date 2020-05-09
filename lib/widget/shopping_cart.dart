import 'package:flutter/material.dart';
import 'package:food/ui/transport_map.dart';
import 'package:food/utils/route_utils.dart';

/// 点餐 -> 购物车
class ShoppingCart extends StatefulWidget {
  final double price;

  const ShoppingCart({Key key, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCart> {
  Widget _convertTextByPrice() {
    if (widget.price == null || widget.price == 0) {
      return Text(
        '未选购商品',
        style: TextStyle(color: Colors.white, fontSize: 14),
      );
    }
    return Text(
      '¥${widget.price}',
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  Widget _convertPayTextByPrice(double price) {
    if (price == null || price == 0) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          '¥20起送',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        color: Colors.black38,
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
      );
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        '去结算',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      color: Color(0xFF7ACE81),
      height: 50,
      padding: EdgeInsets.only(left: 20, right: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Image.asset('images/a3n.png', width: 50, height: 50),
                Column(
                  children: <Widget>[
                    _convertTextByPrice(),
                    Text('另需配送费¥0', style: TextStyle(fontSize: 10))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              var url = 'sample://transport_map';
              RouteUtils.launch(context, TransportMap(), url);
            },
            child: _convertPayTextByPrice(widget.price),
          )
        ],
      ),
      color: Colors.black54,
      height: 50,
    );
  }
}
