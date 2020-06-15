import 'package:flutter/material.dart';

class Intercept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("导航栏返回拦截")),
        body: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次退出"),
          ),
        ));
  }
}
