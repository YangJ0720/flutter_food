import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';

class HomeBanner extends StatefulWidget {
  final List<String> banner;

  HomeBanner(this.banner);

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State {
  /// Banner轮播图数据
  final List<Widget> _banner = [
    CachedNetworkImage(
      imageUrl:
          'https://img4.mukewang.com/540e57300001d6d906000338-240-135.jpg',
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    ),
    CachedNetworkImage(
      imageUrl:
          'https://img3.mukewang.com/5ce4b199083e469306000338-240-135.jpg',
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    ),
    CachedNetworkImage(
      imageUrl: 'https://img.mukewang.com/5dd7561309f8ae4806000338-240-135.png',
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    ),
    CachedNetworkImage(
      imageUrl:
          'https://img4.mukewang.com/5de8a5740989152106000338-240-135.png',
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BannerView(
        items: _banner,
      ),
      height: 120,
    );
  }
}
