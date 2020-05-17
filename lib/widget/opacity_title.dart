import 'package:flutter/material.dart';

class OpacityTitle extends StatefulWidget {
  final String title;

  const OpacityTitle(Key key, {this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OpacityTitleState();
  }
}

class OpacityTitleState extends State<OpacityTitle> {
  double _opacity = 0;

  void changedOpacity(double opacity) {
    setState(() => this._opacity = opacity);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: _opacity, child: Text(widget.title));
  }
}
