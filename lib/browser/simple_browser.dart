import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 浏览器
class SimpleBrowser extends StatefulWidget {
  final String title;
  final String url;

  SimpleBrowser(this.title, this.url);

  @override
  _SimpleBrowserState createState() => _SimpleBrowserState();
}

class _SimpleBrowserState extends State<SimpleBrowser> {
  /// 页面是否加载完毕
  bool _isFinish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              print('onPageStarted -> $url');
            },
            onPageFinished: (url) {
              setState(() {
                _isFinish = true;
              });
              print('onPageFinished -> $url');
            },
          ),
          _isFinish ? Container() : Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
