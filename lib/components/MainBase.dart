import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConnectLive.dart';
import 'Home.dart';
import 'LoginNeed.dart';

var mainColor = Colors.white;
final unselectedColor = Colors.grey[400];
//final selectedColor = Colors.deepOrange;
final selectedColor = Colors.green;

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var screens = <Widget>[];

  @override
  void initState() {
    super.initState();
    screens.add(Home());
    screens.add(ConnectLive());
    screens.add(LoginNeedPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: Home(),

      body: Stack(
        children: <Widget>[
          new PageView(
            controller: _pageController,
            children: screens,
//         physics: NeverScrollableScrollPhysics(), //PageView 可以设置禁止滑动 如果 pagview 嵌套 pagview 会因为滑动冲突导致父pageView无法滑动
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 1)
                mainColor = Colors.transparent;
              else
                mainColor = Colors.white;
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: BottomNavigationBar(
                  iconSize: 27,
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: mainColor,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    if (index == 1)
                      mainColor = Colors.transparent;
                    else
                      mainColor = Colors.white;

                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: _currentIndex == 0
                            ? selectedColor
                            : unselectedColor,
                      ),
//            title: Text(
//              '主页',
//              style: TextStyle(
//                  color: _currentIndex == 0 ? selectedColor : unselectedColor),
//            ),
                      title: Padding(padding: EdgeInsets.all(0)),
//            backgroundColor: mainColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.video_call,
                        color: _currentIndex == 1
                            ? selectedColor
                            : unselectedColor,
                      ),
//            title: Text(
//              '',
//              style: TextStyle(color: Colors.white),
//            ),
                      title: Padding(padding: EdgeInsets.all(0)),
//            backgroundColor: Colors.transparent,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: _currentIndex == 2
                            ? selectedColor
                            : unselectedColor,
                      ),
//            title: Text(
//              '',
//              style: TextStyle(color: Colors.white),
//            ),
                      title: Padding(padding: EdgeInsets.all(0)),
//            backgroundColor: mainColor,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
