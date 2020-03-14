import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0,
            brightness: Brightness.dark,
            backgroundColor: Colors.grey,
            primary: true,
            expandedHeight: 200,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text('title'),
                ),
                Container(
                  child: TextField(),
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Container(
              height: 800,
              child: Center(
                child: Text('data'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
