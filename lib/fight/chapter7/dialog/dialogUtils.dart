import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//基础选择框
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

//多个选择框
Future<void> itemDialog(BuildContext context) async {
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

//列表选择框
Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int indext) {
                    return ListTile(
                      title: Text("$indext"),
                      onTap: () => Navigator.of(context).pop(indext),
                    );
                  }),
            ),
          ],
        );
        return Dialog(child: child);
      });
  if (index != null) {
    print("点击了:$index");
  }
}

//自定义Dialog
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(microseconds: 150),
      transitionBuilder: _buildMaterialDialogTransition);
}

Widget _buildMaterialDialogTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> sencondAnimation,
    Widget child) {
  return ScaleTransition(
    scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
    child: child,
  );
}

class DialogRouterState extends StatefulWidget {
  @override
  _DialogRouterState createState() => new _DialogRouterState();
}

class _DialogRouterState extends State<DialogRouterState> {
  bool whiteTree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("对话框"),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog(context);
            if (delete == null) {
              print("取消删除");
            } else {
              print("同时删除子目录:$delete");
            }
          },
        )
      ],
    );
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    whiteTree = false;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("您确定要删除当前文件嘛?"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录"),
                    Checkbox(
                      value: whiteTree,
                      onChanged: (bool value) {
                        setState(() {
                          whiteTree = !whiteTree;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  Navigator.of(context).pop(whiteTree);
                },
              )
            ],
          );
        });
  }
}

Future<bool> showCheckDialog(BuildContext context) {
  bool _withTree = false; //记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree, //默认不选中
                  onChanged: (bool value) {
                    //更新选中状态
                    _withTree = !_withTree;
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

//单独抽离逻辑的Check Dialog
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({Key key, this.value, @required this.onChanged});

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckbox createState() => _DialogCheckbox();
}

class _DialogCheckbox extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        widget.onChanged(v);
        setState(() {
          value = v;
        });
      },
    );
  }
}

//底部菜单
Future<int> showModalBottomDialog(BuildContext context) {
  return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        });
      });
}

Future<int> showLoadingDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Text("正在加载请稍后"),
                    )
                  ],
                ),
              )),
        );
      });
}

Future<DateTime> showCandlerDialog(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(Duration(days: 30)),
  );
}

Future<DateTime> showIosCandleDialog(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(Duration(days: 30)),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      });
}
