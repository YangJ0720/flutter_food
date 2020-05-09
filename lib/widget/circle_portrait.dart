import 'dart:io';

import 'package:flutter/material.dart';

/// 我的 -> 圆角头像
class CirclePortrait extends StatelessWidget {
  final String path;
  final double width;
  final double height;

  const CirclePortrait({Key key, this.path, this.width = 40, this.height = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image image;
    if (path == null) {
      image = Image.asset('images/a4j.png');
    } else {
      image = Image.file(File(path));
    }
    return Container(
      width: width,
      height: height,
      child: ClipOval(child: image),
    );
  }
}
