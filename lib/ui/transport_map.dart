import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransportMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransportMapState();
  }
}

class TransportMapState extends State<TransportMap> {
  Widget _getPlatformMapView() {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: 'platform_map_view',
        creationParams: <String, dynamic>{'text': 'Android Map View'},
        creationParamsCodec: StandardMessageCodec(),
      );
    } else if (Platform.isIOS) {
      return UiKitView(
        viewType: 'platform_map_view',
        creationParams: <String, dynamic>{'text': 'iOS Map View'},
        creationParamsCodec: StandardMessageCodec(),
      );
    } else {
      return Text("Not supported");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text('地图'),
            Expanded(child: _getPlatformMapView())
          ],
        ),
      ),
    );
  }
}
