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
  final String _url = "https://bkimg.cdn.bcebos.com/pic/d0c8a786c9177f3ea44726977acf3bc79f3d563d?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg";

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
                child: CachedNetworkImage(
                    imageUrl: _url
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return UserInfo(_url);
        }));
      },
    );
  }
}
