import 'package:flutter/material.dart';

/// 网络请求失败
class NetworkErrorView extends StatelessWidget {
  final ValueChanged<int> valueChanged;

  const NetworkErrorView({Key key, this.valueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('images/bej.png', width: 100, height: 100),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('你的网络开小差了'),
              ),
              OutlineButton(
                onPressed: () {
                  if (valueChanged != null) {
                    valueChanged(0);
                  }
                },
                child: Text('重试'),
              )
            ],
          ),
        )
      ],
    );
  }
}
