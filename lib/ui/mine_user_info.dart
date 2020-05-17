import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:food/ui/user_info.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/circle_portrait.dart';

/// 我的 -> 用户信息
class MineUserInfo extends StatefulWidget {

  const MineUserInfo({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MineUserInfoState();
  }
}

class MineUserInfoState extends State<MineUserInfo> {
  String _path;

  void changedPath(String path) {
    _path = path;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '立即登录',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  Text('饿不饿都上饿了么'),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Container(
              child: CirclePortrait(path: _path, width: 80, height: 80),
              margin: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
      onTap: () {
        var url = 'sample://user_info';
        Map<String, dynamic> urlParams = Map();
        urlParams['path'] = _path;
        RouteUtils.launch(context, UserInfo(), url, urlParams: urlParams);
      },
    );
  }
}
