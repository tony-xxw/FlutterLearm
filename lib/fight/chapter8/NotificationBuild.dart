import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBuild extends StatefulWidget {
  @override
  CustomNotification createState() => CustomNotification();
}

class _NotificationBuild extends State<NotificationBuild> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          print("滚动停止");
//          switch (notification.runtimeType) {
//            case ScrollStartNotification:
//              print("开始滚动");
//              break;
//            case ScrollUpdateNotification:
//              print("正在滚动");
//              break;
//            case ScrollEndNotification:
//              print("滚动停止");
//              break;
//            case OverscrollNotification:
//              print("滚动到边界");
//              break;
//          }
          return true;
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class CustomNotification extends State<NotificationBuild> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + " ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}
