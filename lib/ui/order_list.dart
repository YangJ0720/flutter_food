import 'package:flutter/material.dart';
import 'package:food/model/order_model.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/order_empty.dart';
import 'package:food/widget/wrap_cache_image.dart';

class OrderList extends StatefulWidget {
  final List<OrderModel> list;
  final ValueChanged<double> valueChanged;

  OrderList(this.list, this.valueChanged);

  @override
  State<StatefulWidget> createState() {
    return OrderListState();
  }
}

class OrderListState extends State<OrderList> {
  static const double SCROLL_DISTANCE = 50;

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  void _onScroll(double pixels) {
    var value = pixels / SCROLL_DISTANCE;
    if (value > 1) {
      value = 1;
    }
    setState(() => widget.valueChanged(value));
  }

  Widget _createButton(String label) {
    return OutlineButton(
      onPressed: () => RouteUtils.launchUndone(context, label),
      child: Text(label, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _createItemView(int index) {
    var model = widget.list[index];
    return GestureDetector(
      child: Card(
          child: Padding(
        child: Row(
          children: <Widget>[
            Container(
              child: WrapCacheImage(url: model.url),
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 10),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(model.name),
                          Image.asset('images/ble.png', width: 15, height: 15)
                        ],
                      ),
                      Text('已取消')
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Text(model.date),
                        Text(model.stateDescription,
                            style: TextStyle(fontSize: 10))
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  Divider(height: 20),
                  Row(
                    children: <Widget>[
                      Text(model.summary),
                      Text('¥${model.price}')
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      _createButton('送祝福'),
                      _createButton('再来一单')
                    ],
                  )
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: EdgeInsets.all(10),
      )),
      onLongPress: () {
        _showDialog().then((value) {
          if (value == 1) {
            widget.list.removeAt(index);
            setState(() {});
          }
        });
      },
    );
  }

  Future<int> _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('确认删除订单？', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('删除的订单无法申请售后和评价'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                OutlineButton(
                  onPressed: () => Navigator.pop(context, 0),
                  child: Text('取消', style: TextStyle(color: Colors.grey)),
                  borderSide: BorderSide(color: Colors.grey),
                  highlightedBorderColor: Colors.grey,
                  highlightColor: Colors.white,
                ),
                OutlineButton(
                  onPressed: () => Navigator.pop(context, 1),
                  child: Text('确定', style: TextStyle(color: Colors.red)),
                  borderSide: BorderSide(color: Colors.red),
                  highlightedBorderColor: Colors.red,
                  highlightColor: Colors.white,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.list.isEmpty) {
      return OrderEmpty();
    }
    return RefreshIndicator(
      child: NotificationListener(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(
                      '我的订单',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('images/ahh.png', width: 20, height: 20)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return _createItemView(index);
                },
                childCount: widget.list.length,
              ),
            ),
          ],
        ),
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _onScroll(notification.metrics.pixels);
          }
          return false;
        },
      ),
      onRefresh: _onRefresh,
    );
  }
}
