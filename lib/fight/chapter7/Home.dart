import 'package:flutter/material.dart';
import 'package:helloflutter/fight/chapter7/DialogPage.dart';

import 'AsyncApiPage.dart';
import 'ColorDart.dart';
import 'Intercept.dart';
import 'ShareDataWidget.dart';
import 'ThemeDart.dart';

void main() => runApp(MeterDesignPage());

class MeterDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MeterDesign 风格容器",
      routes: {
        "intercept": (context) => Intercept(),
        "share": (context) => InheritedWidgetTestRoute(),
        "color": (context) => ColorDart(),
        "theme": (context) => ThemePage(),
        "async": (context) => AsyncApiPage(),
        "dialog": (context) => DialogPage(),
        '/': (context) => HomePage(
              title: "功能性组件",
            )
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("返回拦截"),
              onPressed: () {
                Navigator.pushNamed(context, "intercept");
              },
            ),
            FlatButton(
              child: Text("组件内共享"),
              onPressed: () {
                Navigator.pushNamed(context, "share");
              },
            ),
            FlatButton(
              child: Text("颜色"),
              onPressed: () {
                Navigator.pushNamed(context, "color");
              },
            ),
            FlatButton(
              child: Text("主题"),
              onPressed: () {
                Navigator.pushNamed(context, "theme");
              },
            ),
            FlatButton(
              child: Text("异步API"),
              onPressed: () {
                Navigator.pushNamed(context, "async");
              },
            ),
            FlatButton(
              child: Text("Dialog"),
              onPressed: () {
                Navigator.pushNamed(context, "dialog");
              },
            ),
          ],
        ),
      ),
    );
  }
}
