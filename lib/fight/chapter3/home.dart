import 'package:flutter/material.dart';
import 'package:helloflutter/fight/chapter3/progress.dart';
import 'package:helloflutter/fight/chapter3/status_manager.dart';
import 'package:helloflutter/fight/chapter3/swith_and_checkbox.dart';
import 'package:helloflutter/fight/chapter3/text.dart';

import 'button.dart';
import 'form.dart';
import 'form_input.dart';
import 'icon_with_image.dart';

void main() => runApp(ChapterTwoHomePage());

class ChapterTwoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "button": (context) => ButtonPage(),
        "iconWithImage": (context) => ImageWithIcon(),
        "progress": (context) => Progress(),
        "checkbox": (context) => SwithAndCheckbox(),
        "text": (context) => TestWidget(),
        "status": (context) => StatusHome(),
        "from_intput": (context) => FormPageInput(),
        "from": (context) => FormStatePage()
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chapter2")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Button"),
            onPressed: () => {Navigator.pushNamed(context, "button")},
          ),
          RaisedButton(
            child: Text("图标与图片"),
            onPressed: () => {Navigator.pushNamed(context, "iconWithImage")},
          ),
          RaisedButton(
            child: Text("进度条"),
            onPressed: () => {Navigator.pushNamed(context, "progress")},
          ),
          RaisedButton(
            child: Text("复选框"),
            onPressed: () => {Navigator.pushNamed(context, "checkbox")},
          ),
          RaisedButton(
            child: Text("文本"),
            onPressed: () => {Navigator.pushNamed(context, "text")},
          ),
          RaisedButton(
            child: Text("状态管理"),
            onPressed: () => {Navigator.pushNamed(context, "status")},
          ),
          RaisedButton(
            child: Text("输入框 "),
            onPressed: () => {Navigator.pushNamed(context, "from_intput")},
          ),
          RaisedButton(
            child: Text(" 表单"),
            onPressed: () => {Navigator.pushNamed(context, "from")},
          ),
        ],
      ),
    );
  }
}
