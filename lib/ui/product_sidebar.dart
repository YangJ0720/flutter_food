import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/store_info_shopping_model.dart';
import 'package:food/widget/wrap_cache_image.dart';

class ProductSidebar extends StatefulWidget {
  final List<StoreInfoSidebarModel> list;

  ProductSidebar(this.list);

  @override
  State<StatefulWidget> createState() {
    return ProductSidebarState();
  }
}

class ProductSidebarState extends State<ProductSidebar> {
  /// 当前选中的item位置
  int _selectorIndex = 0;

  /// 左侧商品选项卡
  List<Widget> _createSidebar() {
    List<Widget> list = List();
    widget.list.asMap().forEach((k, v) {
      var item = GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: _createSidebarText(k, v),
          color: k == _selectorIndex ? Colors.white : Colors.transparent,
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        ),
        onTap: () => {setState(() => _selectorIndex = k)},
      );
      list.add(item);
    });
    return list;
  }

  Widget _createSidebarText(int i, StoreInfoSidebarModel model) {
    /// 如果是普通仅包含文本的item
    if (model.imageUrl == null) {
      return Text(model.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: i == _selectorIndex
              ? TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)
              : TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12));
    }

    /// 否则就是左侧带有icon的文本item
    return Row(
      children: <Widget>[
        Container(
          child: WrapCacheImage(url: model.imageUrl, isPlaceholder: false),
          width: 10,
          height: 10,
        ),
        Text(model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: i == _selectorIndex
                ? TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)
                : TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _createSidebar(),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
