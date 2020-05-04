import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchVoiceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchVoiceViewState();
  }
}

class SearchVoiceViewState extends State<SearchVoiceView> {
  MethodChannel _methodChannel;

  @override
  void initState() {
    super.initState();
    _methodChannel = MethodChannel('method_channel_search_voice');
    _methodChannel.setMethodCallHandler((MethodCall call) {
      return Future<String>(() {
        return call.method;
      });
    });
  }

  @override
  void dispose() {
    _methodChannel.setMethodCallHandler(null);
    _methodChannel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text('说出你想要的宝贝'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
      ),
      onTapDown: (TapDownDetails details) {
        _methodChannel.invokeMethod('start');
      },
      onTapUp: (TapUpDetails details) {
        _methodChannel.invokeMethod('stop');
      },
      onTapCancel: () {
        _methodChannel.invokeMethod('stop');
      },
    );
  }
}
