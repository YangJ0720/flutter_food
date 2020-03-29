import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final String title;
  final EdgeInsets padding;

  const HomeListTile({Key key, this.title, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
