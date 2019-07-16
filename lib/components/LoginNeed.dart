import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GradientAppBar.dart';
import 'Login.dart';

class LoginNeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginNeedPage();
}

class _LoginNeedPage extends State<LoginNeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        children: [
          new AppBarTitle('我'),
        ],
      ),
      body: new Container(
        child: new Align(
          alignment: Alignment.center,
          child: new Wrap(
            direction: Axis.vertical,
            spacing: 20.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/bird.png',
                width: 100.0,
              ),
              new Text(
                '还没登录哦...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 120.0),
                child: new MaterialButton(
                  minWidth: 175.0,
                  height: 45.0,
//                  color: Colors.green,
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
                    '登录',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
