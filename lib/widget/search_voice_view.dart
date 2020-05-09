import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchVoiceView extends StatefulWidget {
  final ValueChanged<String> valueChanged;
  final ValueChanged<double> changedOpacity;

  SearchVoiceView(this.valueChanged, this.changedOpacity);

  @override
  State<StatefulWidget> createState() {
    return SearchVoiceViewState();
  }
}

class SearchVoiceViewState extends State<SearchVoiceView> {
  bool isTouch = false;
  MethodChannel _methodChannel;

  Widget _createTextByTouch() {
    if (isTouch) {
      return Container(
        alignment: Alignment.center,
        child: Text('松开识别'),
        width: 100,
        height: 25,
      );
    }
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.asset('images/a6j.png', width: 25, height: 25),
        ),
        Text('说出你想要的宝贝'),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  void initState() {
    super.initState();
    _methodChannel = MethodChannel('method_channel_search_voice');
    _methodChannel.setMethodCallHandler((MethodCall call) {
      return Future<String>(() {
        var method = call.method;
        if ('setResult' == method) {
          widget.valueChanged(call.arguments.toString());
        }
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
        child: _createTextByTouch(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFFF5F5F5),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: EdgeInsets.only(bottom: 10),
      ),
      onTapDown: (TapDownDetails details) {
        isTouch = true;
        widget.changedOpacity(1);
        _methodChannel.invokeMethod('start');
      },
      onTapUp: (TapUpDetails details) {
        isTouch = false;
        widget.changedOpacity(0);
        _methodChannel.invokeMethod('stop');
      },
      onTapCancel: () {
        isTouch = false;
        widget.changedOpacity(0);
        _methodChannel.invokeMethod('stop');
      },
    );
  }
}
