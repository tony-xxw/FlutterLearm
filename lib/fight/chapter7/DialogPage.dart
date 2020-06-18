import 'package:flutter/material.dart';

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
            child: Text("列表对话框"),
            onPressed: () async {
              await listDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

Future<bool> normalDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<void> listDialog(BuildContext context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("中文简体"),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("美国英语"),
              ),
            )
          ],
        );
      });
  if (i != null) {
    print("选择了:${i == 1 ? "中文简体" : "美国英语"}");
  }
}
