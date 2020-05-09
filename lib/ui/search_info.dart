import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/search_voice_view.dart';

/// 搜索界面
class SearchInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchInfoState();
  }
}

class SearchInfoState extends State<SearchInfo> {
  /// 搜索框文本内容
  String _content = '';
  double _opacity = 0;

  void _changedContent(String content) {
    setState(() => _content = content);
  }

  void _changedOpacity(double opacity) {
    setState(() => _opacity = opacity);
  }

  Widget _createTextField() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200, maxHeight: 40),
      child: TextField(
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: _content,
            selection: TextSelection.fromPosition(
              TextPosition(
                affinity: TextAffinity.downstream,
                offset: _content.length,
              ),
            ),
          ),
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFFF0F0F0)),
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintText: '麦当劳',
          fillColor: Color(0xFFF0F0F0),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFFF0F0F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xFFF0F0F0)),
          ),
        ),
        style: TextStyle(fontSize: 14),
        onChanged: (value) => _changedContent(value),
      ),
    );
  }

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
          child: _createTextField(),
          flex: 8,
        ),
        Expanded(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Text('搜索'),
              ),
              onTap: () {
                if (_content == null || _content.length == 0) {
                  return;
                }
                RouteUtils.launchUndone(context, _content);
              },
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _createAppBar(context),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '搜索发现',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                          _createItem('怪兽串串'),
                        ],
                        spacing: 10,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
            SearchVoiceView(_changedContent, _changedOpacity),
            Center(
              child: Opacity(
                opacity: _opacity,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/a6w.png'),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
            )
          ],
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
