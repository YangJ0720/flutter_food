import 'package:flutter/material.dart';
import 'package:food/browser/simple_browser.dart';

class MineMemberCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineMemberCardState();
  }
}

class MineMemberCardState extends State<MineMemberCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SimpleBrowser(
                    '超级会员', 'https://www.ele.me');
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFEBCD), Color(0xFFFFE4B5)])),
              padding: EdgeInsets.all(10),
              child: Stack(children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.home),
                    Expanded(
                      child: Text('超级会员'),
                    ),
                    Text('开通后，每月领超过20元红包', style: TextStyle(fontSize: 12),)
                  ],
                )
              ],),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SimpleBrowser(
                    '开通会员', 'https://open.shop.ele.me/openapi');
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFFFFFAF0)])),
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Expanded(
                    child: Text(
                      '开通后得1年超级会员',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      '立即开通',
                      style: TextStyle(fontSize: 12),
                    ),
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 0.1,
                        color: Color(0xFF999999),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
