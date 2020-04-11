import 'package:flutter/material.dart';
import 'package:food/model/home_tab_view_model.dart';
import 'package:food/widget/store_info_summary.dart';
import 'package:food/widget/store_search_sliver.dart';
import 'package:food/widget/store_tab_bar.dart';
import 'package:food/widget/store_tab_view_brand.dart';
import 'package:food/widget/store_tab_view_evaluation.dart';
import 'package:food/widget/store_tab_view_order.dart';

/// 商铺信息
class StoreInfo extends StatefulWidget {
  final HomeTabViewModel model;

  StoreInfo(this.model);

  @override
  State<StatefulWidget> createState() {
    return StoreInfoState();
  }
}

class StoreInfoState extends State<StoreInfo> {
  final List<String> _tabs = ['点餐', '评价', '商家'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: NotificationListener(
        child: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              StoreSearchSliver(),
              SliverToBoxAdapter(
                child: StoreInfoSummary(widget.model),
              ),
              StoreTabBar(_tabs)
            ],
            body: TabBarView(
              children: [
                StoreTabViewOrder(),
                StoreTabViewEvaluation(),
                StoreTabViewBrand()
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
