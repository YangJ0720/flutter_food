import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/ui/transport_map_more_sliver.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/transport_map_knight_info.dart';

/// 骑手送餐地图界面
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
      body: Stack(
        children: <Widget>[
          _getPlatformMapView(),
          CustomScrollView(
            slivers: <Widget>[
              TransportMapMoreSliver(),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '骑手正在送货',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[Text('预计送达'), Text('18:26')],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: <Widget>[Text('准时宝')],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                onPressed: () {
                                  RouteUtils.launchUndone(context, '申请退款');
                                },
                                child: Text('申请退款'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: OutlineButton(
                                onPressed: null,
                                child: Text('催单'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: OutlineButton(
                                onPressed: () {
                                  RouteUtils.launchUndone(context, '确认收货');
                                },
                                child: Text('确认收货'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(height: 10),
                      TransportMapKnightInfo()
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  padding: EdgeInsets.all(10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
