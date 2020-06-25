import 'package:flutter/material.dart';

class FormPageInput extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<FormPageInput> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerDefault = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });

    _controllerDefault.text = "默认选中";
    _controllerDefault.selection = TextSelection(
        baseOffset: 2, extentOffset: _controllerDefault.text.length);

    //监听焦点
    _focusNode1.addListener(() {
      print("_focusNode1  ${_focusNode1.hasFocus}");
    });
    //监听焦点
    _focusNode2.addListener(() {
      print("_focusNode2  ${_focusNode2.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("输入框")),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: _controllerDefault,
            decoration: InputDecoration(
                labelText: "默认",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            autofocus: true,
            controller: _controller,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "你的登录密码",
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text("移动焦点"),
                onPressed: () {
                  if (null == focusScopeNode) {
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(_focusNode2);
                },
              ),
              RaisedButton(
                child: Text("隐藏键盘"),
                onPressed: () {
                  _focusNode1.unfocus();
                  _focusNode2.unfocus();
                },
              ),
              RaisedButton(
                child: Text("获取文本内容"),
                onPressed: () {
                  print(_controller.text);
                },
              )
            ],
          ),
          TextField(
            autofocus: true,
            focusNode: _focusNode1,
            decoration: InputDecoration(labelText: "Input1"),
          ),
          TextField(
            autofocus: true,
            focusNode: _focusNode2,
            decoration: InputDecoration(labelText: "Input2"),
          ),
        ],
      ),
    );
  }
}
