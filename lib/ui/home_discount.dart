import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/ui/undone_show.dart';
import 'package:food/widget/wrap_cache_image.dart';

class HomeDiscount extends StatelessWidget {
  final String url;

  const HomeDiscount({Key key, this.url}) : super(key: key);

  void _onClick(BuildContext context) {
    PageRoute route = MaterialPageRoute(builder: (_) => UndoneShow('活动'));
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        child: Container(
          child: WrapCacheImage(url: url, isPlaceholder: false),
          margin: EdgeInsets.only(left: 5, right: 5),
        ),
        onTap: () => {_onClick(context)},
      ),
    );
  }
}
