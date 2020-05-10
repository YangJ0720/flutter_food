import 'package:flutter/material.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/ui/store_tab_view_order_details.dart';
import 'package:food/utils/route_utils.dart';
import 'package:food/widget/expand_number.dart';
import 'package:food/widget/wrap_cache_image.dart';

class ProductCard extends StatefulWidget {
  final List<StoreInfoRecommendSubModel> list;
  final ValueChanged<double> valueChanged;

  ProductCard(this.list, this.valueChanged);

  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  /// 跳转商品详情界面
  void _onRouteProductPage() {
    var url = 'sample://product_info';
    RouteUtils.launch(context, StoreTabViewOrderDetails(), url);
  }

  Widget _createItemView(StoreInfoRecommendSubModel model) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Container(
                child: WrapCacheImage(url: model.imageUrl),
                width: 150,
                height: 150,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    Text(model.name,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(model.shipments,
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    Row(
                      children: <Widget>[
                        Text(
                          '¥${model.price}',
                          style: TextStyle(color: Colors.red),
                        ),
                        ExpandNumber(
                          model: model,
                          valueChanged: widget.valueChanged,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 0.5,
                offset: Offset(0, 1),
              )
            ],
            color: Colors.white),
        margin: EdgeInsets.all(5),
      ),
      onTap: () => _onRouteProductPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (_, index) => _createItemView(widget.list[index]),
      itemExtent: 150,
      scrollDirection: Axis.horizontal,
    );
  }
}
