import 'dart:async';

import 'package:flutter/material.dart';

/// 广告轮播器
class BannerView extends StatefulWidget {
  final List<Widget> items;

  const BannerView({Key key, this.items}) : super(key: key);

  /// 获取广告轮播页数
  int getRealCount() {
    return items.length;
  }

  @override
  State<StatefulWidget> createState() => BannerViewState();
}

class BannerViewState extends State<BannerView> {
  /// 当前显示的广告页
  int _currentPage = -1;

  /// 广告轮播真实页数
  int _realCount = 0;

  /// 广告轮播累加页数
  int _childCount = 0;

  /// 广告轮播指示器下标
  int _indicator = 0;

  /// 广告轮播控制器
  PageController _controller;

  /// 广告轮播定时器
  Timer _timer;

  /// 广告轮播页面触摸控制
  bool isTouch = false;

  @override
  void initState() {
    _realCount = widget.getRealCount();
    _childCount = _realCount * 2;
    _controller = PageController(initialPage: _realCount);
    if (_timer == null) {
      _timer = Timer.periodic(Duration(milliseconds: 5000), (_timer) {
        if (isTouch) {
          return;
        }
        _currentPage++;
        _controller.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        createPageView(),
        createIndicator(),
      ],
    );
  }

  /// 创建PageView
  Widget createPageView() {
    return Listener(
      onPointerDown: (event) {
        isTouch = true;
      },
      onPointerMove: (event) {
        isTouch = true;
      },
      onPointerUp: (event) {
        isTouch = false;
      },
      onPointerCancel: (event) {
        isTouch = false;
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is UserScrollNotification ||
              notification is ScrollEndNotification) {
            /// 如果是通过手势滑动到起始位置，需要设置轮播跳转到_realCount
            if (_currentPage == 0) {
              setState(() {
                _currentPage = _realCount;
                _controller.jumpToPage(_currentPage);
              });
            }
          }
          return false;
        },
        child: PageView.custom(
          onPageChanged: (index) {
            _currentPage = index;
            _indicator = index % _realCount;

            /// 需要对_childCount的自增做控制，不能使其无限大
            controlChildCount(index);
          },
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return widget.items[index % _realCount];
          }, childCount: _childCount),
        ),
      ),
    );
  }

  /// 创建指示器
  Widget createIndicator() {
    List<Widget> _list = [];
    for (int i = 0; i < _realCount; i++) {
      var item = Container(
        margin: EdgeInsets.all(5),
        width: 20,
        height: 1,
        color: _indicator == i ? Colors.white : Color(0xFFADADAD),
      );
      _list.add(item);
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _list,
      ),
    );
  }

  /// 需要对_childCount的自增做控制，不能使其无限大
  void controlChildCount(int index) {
    if (index + _realCount > _childCount) {
      setState(() {
        _childCount++;
      });
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
