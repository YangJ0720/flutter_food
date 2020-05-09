import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/location_refresh_view.dart';
import 'package:food/widget/location_text_field.dart';

/// 选择收货地址
class LocationInfo extends StatefulWidget {
  final String address;

  const LocationInfo({Key key, this.address}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LocationInfoState();
  }
}

class LocationInfoState extends State<LocationInfo> {
  String _address;

  Widget _createItem(String text) {
    return FlatButton(
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.grey)),
      color: Color(0x40DCDCDC),
    );
  }

  Widget _createAddressItem(String town, String streetNumber) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                town,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Text(streetNumber),
          Text(
            '张三（先生）188****8888',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Divider(height: 10)
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _address = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/a1t.png',
                        width: 15,
                        height: 15,
                      ),
                      width: 40,
                      height: 30,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '选择收货地址',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('管理', style: TextStyle(color: Colors.blue)),
                    width: 40,
                    height: 30,
                  )
                ],
              ),
              LocationTextField(),
              Divider(height: 10),

              /// 当前定位
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Text('当前定位'),
                    LocationRefreshView(address: _address),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Divider(height: 10),

              /// 收货地址
              Container(
                child: Column(
                  children: <Widget>[
                    Text('收货地址'),
                    _createAddressItem('测试地址1', 'A单元1205室'),
                    _createAddressItem('测试地址2', 'B单元1206室'),
                    Row(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            RouteUtils.launchUndone(context, '新增地址');
                          },
                          child: Text(
                            '新增地址',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Image.asset('images/ble.png', width: 15, height: 15),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              ),
              Divider(height: 10),

              /// 附近地址
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Text('附近地址'),
                    Row(
                      children: <Widget>[
                        Text('更多'),
                        Image.asset('images/ble.png', width: 15, height: 15),
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  children: <Widget>[
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                    _createItem('附近地址1'),
                  ],
                  spacing: 10,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
