import 'package:flutter/material.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/ui/store_tab_view_order.dart';
import 'package:food/ui/store_tab_view_order_details.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/expand_number.dart';
import 'package:food/widget/wrap_cache_image.dart';

class ProductListView extends StatefulWidget {
  final List<StoreInfoListModel> list;
  final ValueChanged<double> valueChanged;

  ProductListView(this.list, this.valueChanged);

  @override
  State<StatefulWidget> createState() {
    return ProductListViewState();
  }
}

class ProductListViewState extends State<ProductListView> {
  /// 跳转商品详情界面
  void _onRouteProductPage() {
    var url = 'sample://product_info';
    RouteUtils.launch(context, StoreTabViewOrderDetails(), url);
  }

  Widget _createItemView(StoreInfoListModel model) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: WrapCacheImage(url: model.imageUrl),
              borderRadius: BorderRadius.circular(2.5),
            ),
            width: 100,
            height: 100,
            margin: EdgeInsets.all(5),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(model.name,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(model.summary,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(model.shipments,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Row(
                    children: <Widget>[
                      Text('¥${model.price}',
                          style: TextStyle(color: Colors.red)),
                      ExpandNumber(
                        model: model,
                        valueChanged: widget.valueChanged,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              height: 100,
              padding: EdgeInsets.only(right: 10),
            ),
          )
        ],
      ),
      onTap: () => _onRouteProductPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => _createItemView(widget.list[index]),
      itemCount: widget.list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
