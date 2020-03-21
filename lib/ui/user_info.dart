import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

/// 个人资料
class UserInfo extends StatefulWidget {
  final String url;

  UserInfo(this.url);

  @override
  State<StatefulWidget> createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  Widget _createLabelByBind(String value, bool isBind) {
    return Text(
      isBind ? (value ?? '已绑定') : '未绑定',
      style: TextStyle(color: isBind ? Colors.black : Colors.blue),
    );
  }

  Widget _createItemByBind(IconData iconData, String label, bool isBind,
      [String value]) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.1))),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label)),
          Container(
              height: 40,
              child: Center(child: _createLabelByBind(value, isBind))),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('个人资料', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: Icon(Icons.keyboard_arrow_left, color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: Text('基础信息', style: TextStyle(fontSize: 10))),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.1))),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('头像')),
                  ClipRRect(
                    child: CachedNetworkImage(
                        imageUrl: widget.url, width: 40, height: 40),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('用户名')),
                Container(height: 40, child: Center(child: Text('张三'))),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('收货地址')),
                Container(height: 40),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text('账号绑定', style: TextStyle(fontSize: 10))),
          _createItemByBind(Icons.label, '手机', true, '188****8888'),
          _createItemByBind(Icons.label, '淘宝', true),
          _createItemByBind(Icons.label, '支付宝', true),
          _createItemByBind(Icons.label, '微博', false),
          _createItemByBind(Icons.label, '微信', true),
          _createItemByBind(Icons.label, 'QQ', false),
        ],
      ),
    );
  }
}
