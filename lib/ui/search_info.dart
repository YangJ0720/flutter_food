import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/widget/search_voice_view.dart';

/// 搜索界面
class SearchInfo extends StatelessWidget {
  final double paddingTop = MediaQueryData.fromWindow(window).padding.top;

  Widget _createAppBar(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 20),
            onPressed: () => {Navigator.pop(context)},
          ),
          flex: 1,
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {},
            color: Color(0xFFF0F0F0),
            child: Text('一点点', style: TextStyle(color: Colors.grey)),
            shape: StadiumBorder(
                side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
          ),
          flex: 8,
        ),
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('搜索'),
            ),
            flex: 1)
      ],
    );
  }

  Widget _createItem(String text) {
    return FlatButton(
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.grey)),
      color: Color(0x40DCDCDC),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SafeArea(
                child: Container(color: Colors.orange, height: paddingTop),
              ),
              _createAppBar(context),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      '搜索发现',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: <Widget>[
                        _createItem('领16元超市红包'),
                        _createItem('下午茶减免配送费'),
                        _createItem('肯德基'),
                        _createItem('喜茶'),
                        _createItem('麻辣香锅'),
                        _createItem('猪脚饭'),
                        _createItem('黄焖鸡米饭'),
                        _createItem('汉堡王'),
                        _createItem('汉堡王'),
                      ],
                      spacing: 10,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
          SearchVoiceView()
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
