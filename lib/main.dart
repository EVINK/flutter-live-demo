import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'components/MainBase.dart';

void main() {
  runApp(new App());
  if (Platform.isAndroid) {
    // 设置沉浸状态: not working
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo Live',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
