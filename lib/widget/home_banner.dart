import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';
import 'package:food/browser/simple_browser.dart';
import 'package:food/widget/wrap_cache_image.dart';

class HomeBanner extends StatefulWidget {
  final List<String> banner;

  const HomeBanner({Key key, this.banner}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> {
  /// Banner轮播图数据
  final List<Widget> _banner = List();

  void _onClick(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => SimpleBrowser('banner', url)));
  }

  Widget _createItem(String url) {
    return GestureDetector(
      child: ClipRRect(
        child: WrapCacheImage(url: url),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () => {_onClick(context, url)},
    );
  }

  @override
  void initState() {
    widget.banner.forEach((i) => {_banner.add(_createItem(i))});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: BannerView(items: _banner),
      height: 100,
    );
  }
}
