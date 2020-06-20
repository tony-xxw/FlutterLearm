import 'package:flutter/material.dart';

import 'dialog/dialogUtils.dart';

void main() => runApp(DialogPage());

class DialogPage extends StatelessWidget {
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
      appBar: AppBar(title: Text("Dialog")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("正常对话框"),
            onPressed: () async {
              bool delete = await normalDialog(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除${delete}");
              }
            },
          ),
          RaisedButton(
            child: Text("竖直选项对话框"),
            onPressed: () async {
              await itemDialog(context);
            },
          ),
          RaisedButton(
            child: Text("列表对话框"),
            onPressed: () async {
              await showListDialog(context);
            },
          ),
          RaisedButton(
              child: Text("蒙层对话框"),
              onPressed: () async {
                showCustomDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("你确定要是删除当前文件?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () => Navigator.of(context).pop(true),
                          )
                        ],
                      );
                    });
              }),
          RaisedButton(
            child: Text("选中复选框"),
            onPressed: () async {
              showCheckDialog(context);
            },
          ),
          RaisedButton(
            child: Text("底部弹出RaisedButton"),
            onPressed: () async {
              showModalBottomDialog(context);
            },
          ),
          RaisedButton(
            child: Text("LoadingDialog"),
            onPressed: () async {
              showLoadingDialog(context);
            },
          ),
          RaisedButton(
            child: Text("日历Dialog"),
            onPressed: () async {
              showCandlerDialog(context);
            },
          ),
          RaisedButton(
            child: Text("IOS日历Dialog"),
            onPressed: () async {
              showIosCandleDialog(context);
            },
          )
        ],
      ),
    );
  }
}
