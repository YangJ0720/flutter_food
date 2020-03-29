import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';
import 'package:food/browser/simple_browser.dart';
import 'package:food/ui/undone_show.dart';

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

  Widget _createItem(String url) {
    return GestureDetector(
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return SimpleBrowser('banner', url);
        }));
      },
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
      child: BannerView(
        items: _banner,
      ),
      height: 100,
    );
  }
}
