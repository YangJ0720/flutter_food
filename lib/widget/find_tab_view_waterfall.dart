import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food/model/find_model.dart';
import 'package:food/model/find_waterfall_model.dart';

/// 发现 -> 瀑布流布局
class FindTabViewWaterfall extends StatefulWidget {
  const FindTabViewWaterfall({Key key, this.model}) : super(key: key);
  final FindModel model;

  @override
  State<StatefulWidget> createState() {
    return FindTabViewWaterfallState();
  }
}

class FindTabViewWaterfallState extends State<FindTabViewWaterfall> {
  final List<FindWaterfallModel> _list = List();

  /// 下拉刷新
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 5));
    _loadData();
  }

  Future<Null> _loadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/find/${widget.model.id}/find_waterfall.json')
        .then((value) {
      Map<String, dynamic> map = json.decode(value);
      List<dynamic> data = map['data'] as List;
      List<FindWaterfallModel> list =
          data.map((i) => FindWaterfallModel.fromJson(i)).toList();

      /// 更新数据列表
      setState(() {
        if (_list.isNotEmpty) {
          _list.clear();
        }
        _list.addAll(list);
      });
    });
  }

  Widget _createItem(int index) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Color(0xFFF6F6F6),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: CachedNetworkImage(
                    imageUrl: _list[index].background, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xE6F5F5F5)),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _list[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _list[index].summary,
                          style: TextStyle(fontSize: 12, color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: StaggeredGridView.countBuilder(
          controller: ScrollController(),
          itemCount: _list.length,
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemBuilder: (context, index) => _createItem(index),
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index % 2 == 0 ? 2 : 1)),
    );
  }
}
