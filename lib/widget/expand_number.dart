import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/event/global_event.dart';
import 'package:food/model/store_info_shopping_model.dart';

/// 商铺信息 -> 点餐份量自定义控件
class ExpandNumber<T extends StoreInfoGeneric> extends StatefulWidget {
  final T model;

  ExpandNumber({Key key, this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExpandNumberState();
}

class ExpandNumberState extends State<ExpandNumber>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _opacity = 0;
  double _distance = 0;
  AnimationController _controller;

  void _sendEvent(double price) {
    GlobalEvent.instance.eventBus.fire(ProductPriceEvent(price));
  }

  @override
  void initState() {
    super.initState();
    if (widget.model.number != 0) {
      _angle = math.pi * 90;
      _opacity = 1;
      _distance = 1;
    }
    _controller = AnimationController(
        duration: Duration(milliseconds: 250), vsync: this);
    Animation<double> animation =
        Tween(begin: 0.0, end: 1.0).animate(_controller);
    animation.addListener(() {
      setState(() {
        _angle = animation.value * (math.pi * 90);
        _opacity = animation.value;
        _distance = animation.value;
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
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Opacity(
          opacity: _opacity,
          child: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Transform.rotate(
                angle: _angle,
                child: Image.asset('images/a2k.png'),
              ),
              onTap: () {
                if (!_controller.isAnimating &&
                    _distance != 0 &&
                    widget.model.number <= 1) {
                  _controller.reverse();
                }
                setState(() {
                  widget.model.number -= 1;
                });
                _sendEvent(-widget.model.price);
              },
            ),
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: _distance * 60),
          ),
        ),
        Opacity(
          opacity: _opacity,
          child: Container(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: _angle,
              child:
                  Text('${widget.model.number == 0 ? 1 : widget.model.number}'),
            ),
            width: 20,
            margin: EdgeInsets.only(right: _distance * 30),
          ),
        ),
        GestureDetector(
          child: Image.asset('images/a2i.png', width: 20, height: 20),
          onTap: () {
            if (!_controller.isAnimating && _distance == 0) {
              _controller.forward();
            }
            setState(() {
              widget.model.number += 1;
            });
            _sendEvent(widget.model.price);
          },
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
