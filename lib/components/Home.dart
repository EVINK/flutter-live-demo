import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'GradientAppBar.dart';
import 'LivePage.dart';
import 'Login.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<Home> with AutomaticKeepAliveClientMixin {
  final _key = UniqueKey();
  WebViewController _controller;

  bool _checkConfiguration() => true;

  _loadHtmlFromAssets(htmlPath) async {
    String fileText = await rootBundle.loadString(htmlPath);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
    if (_checkConfiguration()) {
      // 延迟执行, 用来获取上下文
      Future.delayed(Duration.zero, () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String key = 'init';
        int initCounter = prefs.getInt(key) ?? 0;
        if (initCounter == 1) {
          return;
        }
        await prefs.setInt(key, 1);
        showDialog(
            context: context,
            // 禁止触摸空白处对话框消失
            barrierDismissible: false,
            builder: (context) => WillPopScope(
                  onWillPop: () async => false,
                  child: AlertDialog(
                    content: Column(
                      children: [
                        Expanded(
                          child: WebView(
                            key: _key,
                            javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: '',
                            onWebViewCreated:
                                (WebViewController webViewController) {
                              _controller = webViewController;
                              _loadHtmlFromAssets(
                                  'assets/html/user-terms.html');
                            },
                            // 拦截web view的url请求
                            navigationDelegate: (NavigationRequest request) {
                              if (request.url.startsWith('js://webview')) {
                                _loadHtmlFromAssets(request.url.substring(18));
                                return NavigationDecision.prevent;
                              }
                              return NavigationDecision.navigate;
                            },
                          ),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: new Text('不同意则无法使用直播服务'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: new Text('好的'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ));
                          },
                          child: Text('不同意')),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('同意')),
                    ],
                  ),
                ));
//            builder: (context) => AlertDialog());
      });
    }
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        children: [
          new AppBarTitle('主页'),
        ],
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? buildHeader(context)
              : buildContent(index, context);
        },
        itemCount: 2,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget buildHeader(BuildContext context) {
  return new Container(
    alignment: Alignment.topLeft,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Image.asset(
          'images/e.jpg',
          width: double.infinity,
          height: 200,
          fit: BoxFit.contain,
        ),
        _buildReminder(context),
      ],
    ),
  );
}


Widget _buildReminder(BuildContext context) {
  return new Row(
    children: <Widget>[
      new Container(
        //设置容器内部边距
        padding: const EdgeInsets.fromLTRB(15.3, 10.0, 0.0, 2.0),
        child: new Column(
          //小部件左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(
                'XX直播 - 主播歌唱大赛',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
            ),
            new Container(
              //设置日期区域距离标题的间距
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(
                '1345人 已预定',
                textAlign: TextAlign.left,
                style: new TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 10.0),
              ),
            ),
          ],
        ),
      ),

      ///预订按钮区域
      new Container(
        //设置容器边距
        padding: const EdgeInsets.only(top: 21.0, left: 20.0),
        child: new Container(
          //容器中小部件居中
          alignment: Alignment.center,
          //设置小部件距离容器的边距
          padding: const EdgeInsets.fromLTRB(14.0, 7.0, 14.0, 7.0),
          //设置装饰器
          decoration: new BoxDecoration(
            //设置边界
            border: new Border.all(
              color: Colors.black38,
              width: 1.0,
            ),
            //设置边界半径
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          ),
          child: new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: new Row(
              //按钮和预订文字水平排列显示
              children: <Widget>[
                new Icon(Icons.timer, color: Colors.black38, size: 12.0),
                new Text(
                  "预订",
                  style: new TextStyle(fontSize: 13.0),
                )
              ],
            ),
          ),
        ),
      ),

      ///分割线
      new Container(
        //设置外边距
        margin: const EdgeInsets.only(left: 9.0),
        color: const Color.fromARGB(255, 233, 233, 233),
        width: 1.0,
        height: 50.6,
      ),

      new Expanded(
        child: new Container(
          padding: const EdgeInsets.only(top: 11.0),
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/iconvideo.png',
                  height: 22.3,
                  fit: BoxFit.cover,
                ),
                new Text(
                  '共1046个视频',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildContent(int index, BuildContext context) {
  return new Column(
    children: <Widget>[
      new Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          top: 40.0,
          bottom: 20.0,
        ),
        child: new Row(
          //等分
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(
                child: new Text(
              '时下热门',
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            )),
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.only(left: 100),
                child: new Image.asset(
                  'images/reload.png',
                  width: 15,
                  height: 15,
                ),
              ),
            )
          ],
        ),
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '安格来了', '安格', 516.6, '种子选手'),
          )),
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(left: 1.5),
              child: _buildContentImageText(context, 'images/clth.jpg',
                  '一个萌萌de歌王', 'CLTH残泪天痕', 1052.1, '毒瘤的聚会'),
            ),
          ),
        ],
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(context, 'images/zbe.png', '今天只想飙高音',
                'ZhangBorn', 5.9, '毒瘤的聚会'),
          )),
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: _buildContentImageText(context, 'images/e.jpg',
                'Gakki的日常', 'Gakki', 1231.1, '人气主播'),
          )),
        ],
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '蓝天 白云', '安溥', 2345.9, '人气主播'),
          )),
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: _buildContentImageText(
                context, 'images/jj.jpg', '绝活之一， 表演睡觉', '晶晶', 12.1, '毒瘤的聚会'),
          )),
        ],
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '今天播户外', '六哥', 255.2, '户外歌手'),
          )),
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '来挑战Rapper', 'JC', 631.1, '人气主播'),
          )),
        ],
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '来吉庆街吃碗面', '海岛', 150.9, '户外'),
          )),
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: _buildContentImageText(
                context, 'images/e.jpg', '酷啦啦', '酷啦啦', 721.0, '人气主播'),
          )),
        ],
      ),
    ],
  );
}

///构建body体图文部分
Widget _buildContentImageText(BuildContext context, String asserPath,
    String desc, String username, double onlinePopulation, String title) {
  return new GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Live()));
      },
      child: new Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            ///Stack控件的每一个子控件都是定位或不定位
            ///定位的子控件是被Positioned控件包裹的。
            ///Stack控件本身包含所有不定位的子控件，其根据alignment定位（默认为左上角）。
            ///然后根据定位的子控件的top、right、bottom和left属性将它们放置在Stack控件上。
            new Stack(
              children: <Widget>[
                //封面图
                new Image.asset(
                  asserPath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                //title标识
                new Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      //RotatedBox:旋转内部小部件;
                      //quarterTurns:旋转的次数;每旋转一次走顺时针方向的四分之一;
                      new RotatedBox(
                        quarterTurns: 2,
                        child: new Image.asset(
                          'images/battle_status_bg_yellow.9.png',
                          width: 60.0,
                          height: 20.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      new Text(
                        title,
                        style:
                            new TextStyle(fontSize: 9.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                //用户名和人气值
                new Positioned(
                  //控制[Stack]子部件位置的小部件
                  left: 15.0,
                  right: 11.0,
                  bottom: 7.0,
                  child: new Row(
                    children: <Widget>[
                      //填充剩余空间
                      new Expanded(
                          child: new Text(
                        username,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      )),
                      new Expanded(
                          child: new Text(
                        '$onlinePopulation 人气',
                        textAlign: TextAlign.right,
                        style:
                            new TextStyle(fontSize: 8.0, color: Colors.white),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              margin: const EdgeInsets.only(top: 7.0, bottom: 16.0),
              child: new Text(
                desc,
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ));
}
