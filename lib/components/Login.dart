import 'package:flutter/material.dart';

import 'GradientAppBar.dart';
import 'Register.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final email = new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: new InputDecoration(
          hintText: '账号/邮箱',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final password = new TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: new InputDecoration(
          hintText: '密码',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: BorderRadius.circular(32.0),
        shadowColor: Colors.green,
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () => showGeneralDialog(
                context: context,
                pageBuilder: (context, a, b) => _generateAlertDialog(),
                barrierDismissible: false,
                barrierLabel: 'barrierLabel',
                transitionDuration: Duration(milliseconds: 400),
              ),
          color: Colors.green,
          child: new Text(
            '登录',
            style: new TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    final registerLabel = new FlatButton(
      onPressed: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
      },
      child: new Text(
        '使用激活码注册',
        style: new TextStyle(color: Colors.black54),
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new GradientAppBar(
        children: [
          new AppBarTitle('登录'),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new ListView(
            shrinkWrap: true,
            padding: new EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
//              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(
                height: 8.0,
              ),
              password,
              SizedBox(
                height: 24.0,
              ),
              loginButton,
              registerLabel
            ],
          ),
        ),
      ),
    );
  }

  _generateAlertDialog() {
    return AlertDialog(
//      title: Text(''),
      content: Text('账号或密码错误'),
      actions: <Widget>[
//        FlatButton(
//          child: Text('取消'),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
        FlatButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
