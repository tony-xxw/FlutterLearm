import 'package:flutter/material.dart';
import 'package:helloflutter/fight/chapter6/CustomScrollViewSample.dart';
import 'package:helloflutter/fight/chapter6/ScrollController.dart';
import 'package:helloflutter/fight/chapter6/SingleChildScrollViewSample.dart';

import 'GirdViewSample.dart';
import 'ListViewSample.dart';

void main() => runApp(MeterDesignPage());

class MeterDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MeterDesign 风格容器",
      routes: {
        "single": (context) => SingleChildScrollViewSample(),
        "list": (context) => ListViewSample(),
        "grid": (context) => GirdViewSample(),
        "custom": (context) => CustomScrollViewSample(),
        "listener": (context) => ScrollControllerSample(),
        '/': (context) => HomePage(
              title: "MeterDesign 风格容器",
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
              child: Text("single"),
              onPressed: () {
                Navigator.pushNamed(context, "single");
              },
            ),
            FlatButton(
              child: Text("list"),
              onPressed: () {
                Navigator.pushNamed(context, "list");
              },
            ),
            FlatButton(
              child: Text("grid"),
              onPressed: () {
                Navigator.pushNamed(context, "grid");
              },
            ),
            FlatButton(
              child: Text("custom"),
              onPressed: () {
                Navigator.pushNamed(context, "custom");
              },
            ),
            FlatButton(
              child: Text("listener"),
              onPressed: () {
                Navigator.pushNamed(context, "listener");
              },
            )
          ],
        ),
      ),
    );
  }
}
