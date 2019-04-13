import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/my_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _selectedColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    ///底部TAbBar模式
    return Scaffold(
      ///页面主体，PageView，用于承载Tab对应的页面
      body: PageView(
        ///必须有的控制器，与tabBar的控制器同步
        controller: _controller,
        ///每一个 tab 对应的页面主体
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      ///底部导航栏，也就是tab栏
      bottomNavigationBar: BottomNavigationBar(
        ///导航栏当前页面index
        currentIndex: _currentIndex,
        ///点击事件
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        ///底部导航栏样式
        type: BottomNavigationBarType.fixed,
        items: [
          ///底部导航栏控件
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _selectedColor,
            ),
            title: Text('首页', style: TextStyle(color: _currentIndex == 0 ? Colors.blue : Colors.grey),)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.search,
                color: _selectedColor,
              ),
              title: Text('搜索', style: TextStyle(color: _currentIndex == 1 ? Colors.blue : Colors.grey),)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.camera,
                color: _selectedColor,
              ),
              title: Text('旅行', style: TextStyle(color: _currentIndex == 2 ? Colors.blue : Colors.grey),)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _selectedColor,
              ),
              title: Text('我的', style: TextStyle(color: _currentIndex == 3 ? Colors.blue : Colors.grey),)
          ),
        ],
      ),
    );
  }
}
