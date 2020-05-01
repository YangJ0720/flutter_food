import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

/// 个人资料
class UserInfo extends StatefulWidget {
  final String path;

  UserInfo({this.path});

  @override
  State<StatefulWidget> createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  String _avatarPath;
  MethodChannel _methodChannel;

  Widget _createLabelByBind(String value, bool isBind) {
    return Text(
      isBind ? (value ?? '已绑定') : '未绑定',
      style: TextStyle(color: isBind ? Colors.black : Colors.blue),
    );
  }

  Widget _createItemByBind(String name, String label, bool isBind,
      [String value]) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.1)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: Image.asset(name),
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(child: Text(label)),
          Container(
            height: 40,
            child: Center(child: _createLabelByBind(value, isBind)),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  Widget _createAvatar() {
    Widget image;
    if (_avatarPath == null) {
      image = Image.asset(widget.path == null ? 'images/a4j.png' : widget.path);
    } else {
      image = Image.file(File(_avatarPath));
    }
    return Container(width: 40, height: 40, child: ClipOval(child: image));
  }

  @override
  void initState() {
    super.initState();
    _methodChannel = MethodChannel('method_channel_user_info');
    _methodChannel.setMethodCallHandler((MethodCall methodCall) {
      return Future<String>(() {
        var method = methodCall.method;
        if ("setPhoto" == method) {
          setState(() => _avatarPath = methodCall.arguments.toString());
        }
        return methodCall.method;
      });
    });
  }

  @override
  void dispose() {
    _methodChannel.setMethodCallHandler(null);
    _methodChannel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('个人资料', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(10),
              child: Text('基础信息', style: TextStyle(fontSize: 10))),
          GestureDetector(
            onTap: () => _methodChannel.invokeMethod('getPhoto', [0]),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('头像')),
                  _createAvatar(),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
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
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('收货地址')),
                Container(height: 40),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Text('账号绑定', style: TextStyle(fontSize: 10)),
          ),
          _createItemByBind('images/a5i.png', '手机', true, '188****8888'),
          _createItemByBind('images/a5k.png', '淘宝', true),
          _createItemByBind('images/a5h.png', '支付宝', true),
          _createItemByBind('images/a5m.png', '微博', false),
          _createItemByBind('images/a5l.png', '微信', true),
          _createItemByBind('images/a5j.png', 'QQ', false),
        ],
      ),
    );
  }
}
