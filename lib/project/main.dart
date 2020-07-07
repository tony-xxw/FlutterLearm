import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
//  runZoned(() {
//    ErrorWidget.builder =(FlutterErrorDetails details) {
//      Zone.current.handleUncaughtError(details.exception, details.stack);
//    }
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("项目"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Text"),
                  onPressed: (() => {print("xxw")}),
                ),
              ],
            ),
          )),
    );
  }
}
