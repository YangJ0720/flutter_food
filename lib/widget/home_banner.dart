import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';

class HomeBanner extends StatefulWidget {
  final List<String> banner;

  const HomeBanner({Key key, this.banner}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State {
  /// Banner轮播图数据
  final List<Widget> _banner = List();

  Widget _createItem(String url) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  @override
  void initState() {
    _banner.add(_createItem('https://img4.mukewang.com/540e57300001d6d906000338-240-135.jpg'));
    _banner.add(_createItem('https://img3.mukewang.com/5ce4b199083e469306000338-240-135.jpg'));
    _banner.add(_createItem('https://img.mukewang.com/5dd7561309f8ae4806000338-240-135.png'));
    _banner.add(_createItem('https://img4.mukewang.com/5de8a5740989152106000338-240-135.png'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: BannerView(
        items: _banner,
      ),
      height: 100,
    );
  }
}
