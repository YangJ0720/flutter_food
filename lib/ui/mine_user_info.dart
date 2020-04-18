import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/ui/user_info.dart';

class MineUserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineUserInfoState();
  }
}

class MineUserInfoState extends State<MineUserInfo> {

  String _path = 'images/a4j.png';

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
                  Row(children: <Widget>[
                    Text(
                      '立即登录',
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.chevron_right),
                  ]),
                  Text('饿不饿都上饿了么'),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.all(20),
              child: ClipOval(
                child: Image.asset(_path),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return UserInfo(_path);
        }));
      },
    );
  }
}
