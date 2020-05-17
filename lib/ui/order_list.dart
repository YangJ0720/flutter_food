import 'package:flutter/material.dart';
import 'package:food/model/order_model.dart';
import 'package:food/ui/order_list_view.dart';
import 'package:food/widget/order_empty_view.dart';

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
    widget.valueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.list.isEmpty) {
      return OrderEmptyView();
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
            OrderListView(list: widget.list),
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
