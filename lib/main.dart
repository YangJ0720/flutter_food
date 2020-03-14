import 'package:flutter/material.dart';
import 'package:food/pages/find_page.dart';
import 'package:food/pages/home_page.dart';
import 'package:food/pages/mine_page.dart';
import 'package:food/pages/order_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _list = [HomePage(), FindPage(), OrderPage(), MinePage()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _list,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
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
