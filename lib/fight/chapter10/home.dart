import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() => runApp(Chapter8());

class Chapter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => HomeChapter10(),
      },
    );
  }
}

class HomeChapter10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter10"),
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
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "gesture");
                },
                child: Text(
                  "手势处理",
                ),
              ),
              RaisedButton(
                child: Text(
                  "事件总线",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "global");
                },
              ),
              RaisedButton(
                child: Text(
                  "通知",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "notification");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
