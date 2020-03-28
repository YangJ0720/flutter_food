import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeDiscount extends StatelessWidget {
  final String url;

  const HomeDiscount({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: CachedNetworkImage(imageUrl: url),
        margin: EdgeInsets.only(left: 5, right: 5),
      ),
    );
  }
}
