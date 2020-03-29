import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/model/home_tab_model.dart';
import 'package:food/model/home_tab_view_model.dart';
import 'package:food/ui/store_info.dart';

class HomeTabViewList extends StatefulWidget {
  final HomeTabModel model;

  HomeTabViewList(this.model);

  @override
  State<StatefulWidget> createState() {
    return HomeTabViewListState();
  }
}

class HomeTabViewListState extends State<HomeTabViewList> {
  List<HomeTabViewModel> _list = List();

  void _onRequest() {
    var id = widget.model.id;
    rootBundle.loadString('assets/home/$id/tab.json').then((value) {
      Map<String, dynamic> map = json.decode(value);
      List<dynamic> data = map['data'];
      List<HomeTabViewModel> list =
          data.map((i) => HomeTabViewModel.fromJson(i)).toList();
      setState(() {
        _list.addAll(list);
      });
    });
  }

  Widget _createText(String text) {
    return Text(text, style: TextStyle(fontSize: 12));
  }

  Widget _createItem(HomeTabViewModel model) {
    return GestureDetector(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: model.icon,
                        fit: BoxFit.cover,
                        width: 79.8,
                        height: 79.8,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 0.2),
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
                _createCard(model.type)
              ],
            ),
            Expanded(
                child: Column(children: <Widget>[
              Text(
                model.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Image.asset('images/bao.png', width: 10, height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text('${model.star}'),
                  ),
                  Expanded(
                    child: _createText('月售${model.sales}'),
                  ),
                  model.professional_delivery
                      ? Image.asset('images/afh.png', width: 50, height: 12)
                      : Container()
                ],
              ),
              Row(
                children: <Widget>[
                  _createText('起送¥${model.starting_price}'),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: _createText('配送¥${model.delivery_fee}'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: _createText(model.arrival_time),
                  ),
                  _createText(model.distance)
                ],
              ),
              Container(
                child: Text(
                  model.summary,
                  style: TextStyle(fontSize: 11, color: Colors.orange),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEFD5),
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
              Divider(height: 20)
            ], crossAxisAlignment: CrossAxisAlignment.start)),
          ],
        ),
        margin: EdgeInsets.only(left: 10, right: 10),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return StoreInfo(model);
          }),
        );
      },
    );
  }

  Widget _createCard(int type) {
    switch (type) {
      case HomeTabViewModel.TYPE_NEW:
        return Image.asset(
          'images/ba6.png',
          width: 40,
          height: 20,
          fit: BoxFit.fill,
        );
      case HomeTabViewModel.TYPE_BRAND:
        return Image.asset(
          'images/ba5.png',
          width: 40,
          height: 20,
          fit: BoxFit.fill,
        );
      default:
        return Container();
    }
  }

  @override
  void initState() {
    _onRequest();
    super.initState();
  }

  @override
  void dispose() {
    _list.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _createItem(_list[index]),
      itemCount: _list.length,
    );
  }
}
