import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 浏览器
class SimpleBrowser extends StatelessWidget {
  final String title;
  final String url;

  const SimpleBrowser(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (url) {
          print('onPageStarted -> $url');
        },
        onPageFinished: (url) {
          print('onPageFinished -> $url');
        },
      ),
    );
  }
}
