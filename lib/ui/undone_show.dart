import 'package:flutter/material.dart';

class UndoneShow extends StatelessWidget {
  final String label;

  UndoneShow(this.label);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/bf2.png', width: 300, height: 300),
            Text('程序员小哥还没有来这里搬砖')
          ],
        ),
      ),
    );
  }
}
