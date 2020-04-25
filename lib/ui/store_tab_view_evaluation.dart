import 'package:flutter/material.dart';

/// 商家详情 -> 评价
class StoreTabViewEvaluation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreTabViewEvaluationState();
  }
}

class StoreTabViewEvaluationState extends State<StoreTabViewEvaluation>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('评价'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
