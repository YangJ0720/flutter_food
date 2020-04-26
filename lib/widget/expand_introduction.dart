import 'package:flutter/material.dart';
import 'dart:math' as math;

/// 商铺信息 -> 自定义折叠布局
class ExpandIntroduction extends StatefulWidget {
  final String text;

  const ExpandIntroduction({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpandIntroductionState();
  }
}

class ExpandIntroductionState extends State<ExpandIntroduction>
    with SingleTickerProviderStateMixin {
  static const double DEFAULT_MIN_HEIGHT = 30;
  static const double DEFAULT_MAX_HEIGHT = 100;
  double _height = DEFAULT_MIN_HEIGHT;
  bool _isExpand = true;

  double _angle = 0;
  AnimationController _controller;

  Widget _createTextView() {
    var style = TextStyle(color: Colors.grey, fontSize: 11);
    if (_height == DEFAULT_MIN_HEIGHT) {
      return Text(
        widget.text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
    }
    return Text(widget.text, style: style);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    var animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    animation.addListener(() {
      setState(() {
        if (_isExpand) {
          /// 收缩 -> 逆时针动画
          _angle = animation.value * -math.pi;

          ///
          var value = animation.value * DEFAULT_MAX_HEIGHT;
          if (value < DEFAULT_MIN_HEIGHT) {
            value = DEFAULT_MIN_HEIGHT;
          }
          _height = value;
        } else {
          /// 展开 -> 顺时针动画
          _angle = (1 - animation.value) * math.pi;

          ///
          var value = animation.value * DEFAULT_MAX_HEIGHT;
          if (DEFAULT_MIN_HEIGHT > value) {
            value = DEFAULT_MIN_HEIGHT;
          }
          _height = value;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          Expanded(child: _createTextView()),
          GestureDetector(
            child: Padding(
              child: Transform.rotate(
                angle: _angle,
                child: Image.asset('images/${_isExpand ? 'b71' : 'b70'}.png',
                    width: 15, height: 15),
                origin: Offset(0, 0),
              ),
              padding: EdgeInsets.only(left: 5),
            ),
            onTap: () {
              if (_controller.isAnimating) {
                return;
              }
              setState(() {
                if (_isExpand) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
                _isExpand = !_isExpand;
              });
            },
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: _height,
      padding: EdgeInsets.only(top: 5, bottom: 5),
    );
  }
}
