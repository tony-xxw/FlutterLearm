import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(StackPosition());

class StackPosition extends StatelessWidget {
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
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
