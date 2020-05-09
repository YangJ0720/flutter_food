import 'package:flutter/material.dart';
import 'package:food/banner/banner_view.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/wrap_cache_image.dart';

/// 轮播图转换器
class SimpleBannerView extends StatelessWidget {
  final List<String> list;

  const SimpleBannerView({Key key, this.list}) : super(key: key);

  Widget _createItem(BuildContext context, String url) {
    return GestureDetector(
      child: ClipRRect(
        child: WrapCacheImage(url: url),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () => RouteUtils.launchWeb(context, 'banner', url),
    );
  }

  List<Widget> _createBannerList(BuildContext context){
    List<Widget> bannerList = List();
    list.forEach((i) => bannerList.add(_createItem(context, i)));
    return bannerList;
  }

  @override
  Widget build(BuildContext context) {
    if (list == null || list.isEmpty) {
      return Container();
    }
    return Container(
      child: BannerView(items: _createBannerList(context)),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(10),
    );
  }
}
