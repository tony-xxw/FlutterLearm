import 'package:flutter/material.dart';

void main() => runApp(FlexLayout());

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
