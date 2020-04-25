import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:food/browser/simple_browser.dart';
import 'package:food/config/build_config.dart';
import 'package:food/ui/undone_show.dart';

/// 路由跳转工具
class RouteUtils {
  /// 根据编译模式切换不同跳转方式
  static void launch(BuildContext context, Object object, String url,
      {Map<String, dynamic> urlParams, Map<dynamic, dynamic> exts}) {
    if (BuildConfig.isDev) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => object));
    } else {
      FlutterBoost.singleton
          .open(url, urlParams: urlParams, exts: exts)
          .then((Map value) {});
    }
  }

  /// 跳转到WebView界面
  static void launchWeb(BuildContext context, String title, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SimpleBrowser(title, url);
    }));
  }

  /// 跳转到功能未完成界面
  static void launchUndone(BuildContext context, String label) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return UndoneShow(label);
    }));
  }
}
