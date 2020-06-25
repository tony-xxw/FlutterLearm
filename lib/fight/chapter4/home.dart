import 'package:flutter/material.dart';

import 'Align.dart';
import 'StackPosition.dart';
import 'WarpFlow.dart';
import 'flex.dart';
import 'linear_page.dart';

void main() => runApp(ChapterTwoHomePage());

class ChapterTwoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "align": (context) => AlignPage(),
        "flex": (context) => FlexLayout(),
        "linear": (context) => LinearPage(),
        "stack": (context) => StackPosition(),
        "flow": (context) => WarpWithFlow(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chapter2")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Text("布局组件"),
          ),
          RaisedButton(
            child: Text("ALIGN"),
            onPressed: () => {Navigator.pushNamed(context, "align")},
          ),
          RaisedButton(
            child: Text("FLEX"),
            onPressed: () => {Navigator.pushNamed(context, "flex")},
          ),
          RaisedButton(
            child: Text("LINEAR"),
            onPressed: () => {Navigator.pushNamed(context, "linear")},
          ),
          RaisedButton(
            child: Text("STACK"),
            onPressed: () => {Navigator.pushNamed(context, "stack")},
          ),
          RaisedButton(
            child: Text("FLOW"),
            onPressed: () => {Navigator.pushNamed(context, "flow")},
          )
        ],
      ),
    );
  }
}
