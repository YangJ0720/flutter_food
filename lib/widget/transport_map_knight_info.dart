import 'package:flutter/material.dart';

class TransportMapKnightInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('images/ajj.png', width: 45, height: 45),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '李四',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    child: Text('蜂鸟专送', style: TextStyle(fontSize: 8)),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    margin: EdgeInsets.only(left: 5),
                  ),
                ],
              ),
              Text('满意度:96%', style: TextStyle(fontWeight: FontWeight.bold))
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        IconButton(icon: Image.asset('images/a_e.png'), onPressed: () {}),
        IconButton(icon: Image.asset('images/a_y.png'), onPressed: () {})
      ],
    );
  }
}
