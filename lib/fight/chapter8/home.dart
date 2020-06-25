import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GesturesHome.dart';
import 'PointerEvent.dart';

void main() => runApp(Chapter8());

class Chapter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        'pointer': (context) => PointEvent(),
        'gesture': (context) => GestureHome(),
        "/": (context) => HomeChapter8()
      },
    );
  }
}

class HomeChapter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter8"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "pointer");
                },
                child: Text(
                  "原始指针处理",
                ),
              ),RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "gesture");
                },
                child: Text(
                  "手势处理",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
