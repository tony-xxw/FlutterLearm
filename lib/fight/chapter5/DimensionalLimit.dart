import 'package:flutter/material.dart';

void main() => runApp(DimensionLimitPage());

class DimensionLimitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "尺寸限制容器",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 50),
            child: Container(
              height: 5,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: redBox,
          ),
          Text("SizedBox 是ConstrainBox一个定制类"),
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(80, 80)),
            child: redBox,
          ),
          Text("父子组件同时限制,区父子组件中最大值"),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60, minHeight: 90),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: redBox,
            ),
          ),
          Text("去除父组件限制,但是父组件的空间还是会存在,如果子组件占有父容器大小,一定是父容器限制"),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100, minHeight: 50),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 50, minHeight: 10),
                  child: redBox,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
