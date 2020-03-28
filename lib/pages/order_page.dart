import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/widget/home_search_sliver.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State with AutomaticKeepAliveClientMixin {
  var _isExpanded = false;

  @override
  void initState() {
    print('initState -> OrderPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Wrap(children: <Widget>[
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
        Padding(padding: EdgeInsets.all(20), child: Text('data', style: TextStyle(backgroundColor: Colors.pink),),),
      ],),),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
