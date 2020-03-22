import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/model/home_tab_model.dart';
import 'package:food/model/home_tab_view_model.dart';

import 'load_view.dart';

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

  Widget _createItem(HomeTabViewModel model) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: model.icon,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
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
                  child:
                      Text('月售${model.sales}', style: TextStyle(fontSize: 12)),
                ),
                model.professional_delivery
                    ? Image.asset('images/afh.png', width: 50, height: 12)
                    : Container()
              ],
            ),
            Row(
              children: <Widget>[
                Text('起送¥${model.starting_price}'),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('配送¥${model.delivery_fee}'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(model.arrival_time),
                ),
                Text(model.distance)
              ],
            )
          ], crossAxisAlignment: CrossAxisAlignment.start)),
        ],
      ),
    );
  }

  @override
  void initState() {
    _onRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? LoadView()
        : ListView.builder(
            itemBuilder: (context, index) => _createItem(_list[index]),
            itemCount: _list.length);
  }
}
