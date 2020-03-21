import 'package:flutter/material.dart';

/// 系统设置
class SystemSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SystemSettingsState();
  }
}

class SystemSettingsState extends State<SystemSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip);
        }),
        title: Text('设置', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF999999), width: 0.1))),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('账户安全')),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}
