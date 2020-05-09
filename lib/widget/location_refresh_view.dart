import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationRefreshView extends StatefulWidget {
  final String address;

  const LocationRefreshView({Key key, this.address}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LocationRefreshViewState();
  }
}

class LocationRefreshViewState extends State<LocationRefreshView> {
  String _address;
  MethodChannel _methodChannel;

  @override
  void initState() {
    super.initState();
    _address = widget.address;
    _methodChannel = MethodChannel('method_channel_location_info');
    _methodChannel.setMethodCallHandler((MethodCall call) {
      return Future<String>(() {
        setState(() => _address = call.arguments);
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
    return Row(
      children: <Widget>[
        Image.asset('images/a7a.png', width: 12, height: 12),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              _address,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            setState(() => _address = '正在定位');
            _methodChannel.invokeMethod('executeLocation');
          },
          child: Text(
            '重新定位',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
