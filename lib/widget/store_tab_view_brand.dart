import 'package:flutter/material.dart';

/// 商家详情 -> 商家
class StoreTabViewBrand extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewBrandState();
  }
}

class StoreTabViewBrandState extends State<StoreTabViewBrand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('商家'),
      ),
    );
  }
}
