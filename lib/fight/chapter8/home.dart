import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Chapter8());

class Chapter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chapter8"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
