import 'package:flutter/material.dart';

class LoadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(top: 10), child: Text('正在加载数据')),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
