import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends Container {
  final String title;

  AppBarTitle(this.title);

  @override
  Widget build(BuildContext ctx) {
    return new Text(
      title,
      style: new TextStyle(
          fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.normal),
    );
  }
}

class GradientAppBar extends PreferredSize implements PreferredSizeWidget {
//  final String title;
  final double barHeight = 50.0;

  final List<Container> children;

  const GradientAppBar({@required this.children});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new PreferredSize(
      child: new Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        width: MediaQuery.of(context).size.width,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Colors.tealAccent[700], Colors.lightBlue,
              ],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.mirror),
        ),
      ),
      preferredSize: new Size(MediaQuery.of(context).size.width, barHeight),
    );
  }

  Size get preferredSize {
    return new Size.fromHeight(this.barHeight);
  }
}
