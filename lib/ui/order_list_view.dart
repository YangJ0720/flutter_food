import 'package:flutter/material.dart';
import 'package:food/model/order_model.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/wrap_cache_image.dart';

class OrderListView extends StatefulWidget {
  final List<OrderModel> list;

  const OrderListView({Key key, this.list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OrderListViewState();
  }
}

class OrderListViewState extends State<OrderListView> {
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
                        Text(
                          model.stateDescription,
                          style: TextStyle(fontSize: 10),
                        )
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
      onTap: () => RouteUtils.launchUndone(context, model.name),
      onLongPress: () {
        _showDialog().then((value) {
          if (value == 1) {
            setState(() => widget.list.removeAt(index));
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return _createItemView(index);
        },
        childCount: widget.list.length,
      ),
    );
  }
}
