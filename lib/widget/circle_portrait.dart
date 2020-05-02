import 'dart:io';

import 'package:flutter/material.dart';

class CirclePortrait extends StatelessWidget {
  final String path;
  final double width;
  final double height;

  const CirclePortrait({Key key, this.path, this.width = 40, this.height = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image =
        path == null ? Image.asset('images/a4j.png') : Image.file(File(path));
    return Container(
      width: width,
      height: height,
      child: ClipOval(child: image),
    );
  }
}
