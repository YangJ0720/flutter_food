import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/ui/search_info.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/wrap_cache_image.dart';

class StoreSearchSliver extends StatelessWidget {
  final String imageUrl;

  StoreSearchSliver({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _StoreSearchDelegate(imageUrl),
      pinned: true,
    );
  }
}

class _StoreSearchDelegate extends SliverPersistentHeaderDelegate {
  static const double MIN_EXTENT = 50;
  final String imageUrl;
  String statusBarMode = 'light';
  var paddingTop = MediaQueryData.fromWindow(window).padding.top;

  _StoreSearchDelegate(this.imageUrl);

  void _updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > MIN_EXTENT && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else if (shrinkOffset <= MIN_EXTENT && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    }
  }

  Color _makeStickyColorByIcon(double shrinkOffset) {
    if (shrinkOffset <= minExtent) {
      return Colors.white;
    }
    double offset = shrinkOffset / (maxExtent - minExtent);
    if (offset > 1) {
      offset = 1;
    }
    int alpha = (255 * offset).toInt();
    return Color.fromARGB(alpha, 0, 0, 0);
  }

  Color _makeStickyColorByBg(double shrinkOffset) {
    if (shrinkOffset <= minExtent) {
      return Colors.transparent;
    }
    double offset = shrinkOffset / (maxExtent - minExtent);
    if (offset > 1) {
      offset = 1;
    }
    int alpha = (255 * offset).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Widget _makeStickySearchWidget(BuildContext context, double shrinkOffset) {
    if (shrinkOffset <= minExtent) {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Image.asset('images/am2.png', width: 20, height: 20),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Image.asset('images/am3.png', width: 20, height: 20),
            )
          ],
        ),
      );
    }
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: FlatButton(
          onPressed: () {
            var url = 'sample://search_info';
            RouteUtils.launch(context, SearchInfo(), url);
          },
          color: Color(0xFFF0F0F0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Image.asset('images/ahh.png', width: 15, height: 15),
              ),
              Text('想吃什么搜一搜', style: TextStyle(color: Colors.grey))
            ],
          ),
          shape: StadiumBorder(
              side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
        ),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    _updateStatusBarBrightness(shrinkOffset);
    return Stack(
      children: <Widget>[
        Container(
          child: WrapCacheImage(url: imageUrl, fit: BoxFit.cover),
          height: maxExtent,
        ),
        Positioned(
          child: Container(
            color: _makeStickyColorByBg(shrinkOffset),
            height: paddingTop,
          ),
          top: 0,
          left: 0,
          right: 0,
        ),
        Positioned(
            child: Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: _makeStickyColorByIcon(shrinkOffset),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  _makeStickySearchWidget(context, shrinkOffset),
                  IconButton(
                    icon: Image.asset(
                      'images/am5.png',
                      width: 20,
                      height: 20,
                      color: _makeStickyColorByIcon(shrinkOffset),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ],
              ),
              color: _makeStickyColorByBg(shrinkOffset),
              height: MIN_EXTENT,
            ),
            top: paddingTop,
            left: 0,
            right: 0)
      ],
      fit: StackFit.expand,
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => MIN_EXTENT + paddingTop;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
