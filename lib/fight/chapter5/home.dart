import 'package:flutter/material.dart';

import 'Containers.dart';
import 'DimensionalLimit.dart';
import 'PaddingWithDecorated.dart';
import 'Transform.dart';
import 'metrai/Home.dart';

void main() => runApp(ChapterTwoHomePage());

class ChapterTwoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "design": (context) => MeterDesignPage(),
        "container": (context) => ContainerPage(),
        "transform": (context) => TransformPage(),
        "padding": (context) => PaddingPage(),
        "decorated": (context) => DimensionLimitPage(),
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
            child: Text("容器类组件"),
          ),
          RaisedButton(
            child: Text("design"),
            onPressed: () => {Navigator.pushNamed(context, "design")},
          ),
          RaisedButton(
            child: Text("container"),
            onPressed: () => {Navigator.pushNamed(context, "container")},
          ),
          RaisedButton(
            child: Text("transform"),
            onPressed: () => {Navigator.pushNamed(context, "transform")},
          ),
          RaisedButton(
            child: Text("padding"),
            onPressed: () => {Navigator.pushNamed(context, "padding")},
          ),
          RaisedButton(
            child: Text("decorated"),
            onPressed: () => {Navigator.pushNamed(context, "decorated")},
          )
        ],
      ),
    );
  }
}
