import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_sdk/config/logger_manager.dart';
import 'package:helloflutter/project/common/error_page.dart';

void main() {
//  runZoned(() {
//    ErrorWidget.builder =(FlutterErrorDetails details) {
//      Zone.current.handleUncaughtError(details.exception, details.stack);
//      return new ErrorPage(details.exception.toString()+"\n"+details.stack.toString(),details)
//    };
//  }
Loggers.init();
Loggers.d("XXW");
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
