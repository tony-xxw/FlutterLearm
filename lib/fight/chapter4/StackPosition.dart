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
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[

              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              ), Container(
                child:
                Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.orange,
              )
            ],
          ),
        ));
  }
}
