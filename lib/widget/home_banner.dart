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
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/9JBHlnd_VeeOmCACOva2qIFFhrU!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/AYV09JvHTIjtTxpRwk8jLy59V8s!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/5mJ7NzI1J18yMWRocHGJ4pxpJzw!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/vYrYdiA0zzgGTVwUtc_L_H-9_Tg!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/1RLegowqEegjye6EzkCAYkc8GA0!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/Bfmo4Dj0VumFJhqoxtCACVtG67M!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/7n_kaBKJhaUpRy7u_IugUYjrv54!MA.jpg'));
    _banner.add(_createItem('https://gitee.com/YangJ0720/flutter_takeout/raw/master/flutter_takeout/images/banner/4-yH3U0jvHYw0p-FsNhpkUyFlwQ!MA.jpg'));
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
