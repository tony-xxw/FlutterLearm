import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_sdk/config/logger_manager.dart';
import 'package:helloflutter/fight/chapter2/new_router.dart';
import 'package:helloflutter/fight/chapter3/icon_with_image.dart';

void main() => runApp(KeySample());

class KeySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [StatelessContainer(), StatelessContainer()];

  @override
  Widget build(BuildContext context) {
    print("啊啊啊");
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  void switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}

class StatelessContainer extends StatelessWidget {
  List colors = [Colors.red, Colors.amber];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: randomColor(),
    );
  }

  Color randomColor() {
    return colors[random.nextInt(2)];
  }
}

class StatefulContainer extends StatefulWidget {
  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  List colors = [Colors.red, Colors.amber];
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: randomColor(),
    );
  }


  Color randomColor() {
    return colors[random.nextInt(2)];
  }
}
