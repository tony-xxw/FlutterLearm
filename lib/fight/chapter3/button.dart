import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "按钮",
      home: ButtonPage(),
    );
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //raised
                RaisedButton(
                  child: Text("悬浮按钮"),
                  onPressed: null,
                ),
                FlatButton(
                  child: Text("扁平按钮"),
                  onPressed: null,
                ),
                OutlineButton(
                  child: Text("边框按钮"),
                  onPressed: null,
                ),
                IconButton(icon: Icon(Icons.thumb_up), onPressed: null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //带图标的按钮
                RaisedButton.icon(
                    onPressed: null, icon: Icon(Icons.send), label: Text("发送")),
                FlatButton.icon(
                    onPressed: null, icon: Icon(Icons.add), label: Text("添加")),
                OutlineButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.details),
                    label: Text("详情")),
              ],
            ),
            //自定义
            Row(
              children: <Widget>[
                RaisedButton(
                  //背景
                  color: Colors.green,
                  //按下背景
                  highlightColor: Colors.greenAccent,
                  //按钮主题
                  colorBrightness: Brightness.light,
                  //点击水波动画的颜色
                  splashColor: Colors.deepOrange,
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
