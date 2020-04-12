import 'package:flutter/material.dart';
import 'package:food/config/network_config.dart';
import 'package:food/widget/store_tab_view_order_details.dart';
import 'package:food/widget/wrap_cache_image.dart';

/// 商家详情 -> 点餐
class StoreTabViewOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewOrderState();
  }
}

class StoreTabViewOrderState extends State<StoreTabViewOrder> {
  ScrollController _controller;

  Widget _createCard() {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: WrapCacheImage(
              url:
                  '${NetworkConfig.HOST_URL}images/details/z5QL3XfBJ5vI2aRrsgNUJjxr5Qo!MA.jpg',
              width: 150,
              height: 150,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: <Widget>[
                Text('遇见小面'),
                Text('月售46'),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('¥16'),
                      Image.asset('images/a2i.png', width: 20, height: 20)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 0.5,
              offset: Offset(0, 1),
            )
          ],
          color: Colors.white),
      width: 150,
      height: 220,
      margin: EdgeInsets.all(5),
    );
  }

  List<Widget> _createItem() {
    List<Widget> list = List();
    list.add(
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '商家推荐',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
    list.add(
      Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              _createCard(),
              _createCard(),
              _createCard(),
              _createCard(),
              _createCard(),
            ],
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
    var count = 100;
    for (int i = 0; i < count; i++) {
      list.add(ListTile(
        title: Text('index = $i'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return StoreTabViewOrderDetails();
          }));
        },
      ));
    }
    return list;
  }

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ListView(children: _createItem())),
        Container(
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
        )
      ],
    );
  }
}
