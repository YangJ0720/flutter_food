import 'package:flutter/material.dart';
import 'package:food/pages/find_page.dart';
import 'package:food/pages/home_page.dart';
import 'package:food/pages/mine_page.dart';
import 'package:food/pages/order_page.dart';

/// 应用程序主界面
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _list = [HomePage(), FindPage(), OrderPage(), MinePage()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: _list,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedIconTheme: IconThemeData(color: Colors.blue),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
              ),
              title: Text('发现')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              title: Text('订单')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('我的')),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
