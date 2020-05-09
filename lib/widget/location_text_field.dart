import 'package:flutter/material.dart';

/// 选择收货地址 -> 地址信息输入框
class LocationTextField extends StatelessWidget {
  Widget _createTextField(Color color) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: color),
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintText: '小区/写字楼/学校等',
          fillColor: color,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: color),
          ),
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text('深圳市'),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Image.asset(
                    'images/yk.png',
                    width: 10,
                    height: 10,
                  ),
                ),
                Container(
                  color: Colors.grey,
                  width: 0.5,
                  height: 20,
                  margin: EdgeInsets.only(left: 10, right: 10),
                ),
                Image.asset('images/ahh.png', width: 15, height: 15)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            margin: EdgeInsets.only(left: 10),
          ),
          Expanded(child: _createTextField(Color(0xFFE0E0E0)))
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
