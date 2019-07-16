import 'dart:ui';

import 'package:flutter/material.dart';

import 'Login.dart';

class ConnectLive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConnectLive();
}

class _ConnectLive extends State<ConnectLive>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      body: new Stack(
        // Stack所创建的Widget会按照创建顺序一层一层地绘制
        // 类似于 css 中的 z-index 属性
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset(
                'images/e.jpg',
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.fitHeight,
                alignment: new Alignment(-0.8, 0),
                // 向右移动了一个屏幕的8%
                filterQuality: FilterQuality.high,
              ),
              new Container(
                child: ClipRect(
                  child: new BackdropFilter(
                      //图片模糊过滤 (横向, 竖向)
//                width:100,
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Opacity(
                          //透明控件
                          opacity: 0.6,
                          child: Container(
                            // 容器组件
                            width: screenWidth,
                            height: screenHeight,
                            decoration: BoxDecoration(color: Colors.black),
//                            decoration: BoxDecoration(
//                                color: Colors.white.withOpacity(0.0)),
                            //盒子装饰器，进行装饰，设置颜色为灰色
//                            child: Center(
//                              child: Text(
//                                'EvinK',
////                        style: Theme.of(context).textTheme.display3,
//                                style: new TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 100,
//                                  fontFamily: '微软雅黑',
//                                ),
//
//                                ///设置比较酷炫的字体
//                              ),
//                            ),
                          ))),
                ),
              ),
            ],
          ),
          new Container(
            padding: new EdgeInsets.only(top: 30.0),
            child: new Align(
              alignment: Alignment.topCenter,
              child: new Text(
                '视频聊',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: '微软雅黑',
                ),
              ),
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 100.0, left: 25.0),
            child: new Align(
              alignment: Alignment.topLeft,
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: Image.asset(
                      'images/unknown_head.png',
                      width: 85.0,
                    ),
                  ),
                  new Container(
                    height: 60.0,
                    padding: new EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: new Wrap(
                      direction: Axis.vertical,
                      spacing: 5.0,
                      children: <Widget>[
                        Text(
                          '游客',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '快，就现在！',
                          style: TextStyle(
                            color: Colors.white70,
                            letterSpacing: 5,
//                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 0.0, left: 0.0),
            child: new Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/about_opening.png',
                width: 200,
              ),
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 400.0, left: 0.0),
            child: new Align(
              alignment: Alignment.center,
              child: MaterialButton(
                minWidth: 145.0,
                height: 45.0,
                color: Colors.green,
                shape: new StadiumBorder(
                    side: new BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.green,
                )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: new Text(
                  '预约',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // page view 切换后仍然保持当前页面的状态
  @override
  bool get wantKeepAlive => true;
}
