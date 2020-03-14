import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print('initState -> OrderPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text('order'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
