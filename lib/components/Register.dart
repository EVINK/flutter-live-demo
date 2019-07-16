import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GradientAppBar.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  TextFormField genPasswordForm(String placeholder) {
    return new TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: new InputDecoration(
          hintText: placeholder,
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );
  }

  TextFormField genTextForm(String placeholder) {
    return new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: new InputDecoration(
          hintText: placeholder,
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        children: [
          new AppBarTitle('注册'),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new ListView(
//            shrinkWrap: true,
            padding: new EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 48.0),
              genTextForm('账号/邮箱'),
              SizedBox(
                height: 8.0,
              ),
              genPasswordForm('密码'),
              SizedBox(
                height: 8.0,
              ),
              genPasswordForm('重复密码'),
              SizedBox(
                height: 8.0,
              ),
              genTextForm('手机号码'),
              SizedBox(
                height: 8.0,
              ),
              genTextForm('真实姓名'),
              SizedBox(
                height: 8.0,
              ),
              genTextForm('身份证号'),
              SizedBox(
                height: 8.0,
              ),
              genTextForm('激活码'),
              SizedBox(
                height: 24.0,
              ),
              new Container(
//                padding: EdgeInsets.only(top: 120.0),
                child: new MaterialButton(
                  minWidth: 175.0,
                  height: 45.0,
                  color: Colors.green,
                  shape: new StadiumBorder(
                      side: new BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.green,
                  )),
                  onPressed: () => showGeneralDialog(
                        context: context,
                        pageBuilder: (context, a, b) => _generateAlertDialog(),
                        barrierDismissible: false,
                        barrierLabel: 'barrierLabel',
                        transitionDuration: Duration(milliseconds: 400),
                      ),
                  child: new Text(
                    '注册',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white70,
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

  _generateAlertDialog() {
    return AlertDialog(
//      title: Text(''),
      content: Text('激活码不正确'),
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
}
