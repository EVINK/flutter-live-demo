import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Live extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Live();
}

class _Live extends State<Live> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('直播间'),
//      ),
      body: new Container(
        alignment: Alignment.topLeft,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              alignment: FractionalOffset.center,
              child: new Text(
                '无信号',
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: new Text(
                        '[ ${new DateFormat('yyyy-MM-dd HH:mm:ss').format(new DateTime.now())} ] 欢迎进入直播间，请保持文明的弹幕礼仪哦！',
                        style: new TextStyle(),
                        textAlign: TextAlign.left,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
//      body: Center(
//        child: RaisedButton(
//            child: Text("Go back"),
//            onPressed: () {
//              print('This is 2nd page');
//              Navigator.pop(context);
//            }),
//      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
