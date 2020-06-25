import 'package:flutter/material.dart';

void main() => runApp(LinearPage());

class LinearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//无法设置纵轴大小,只会根据子元素最大宽度来计算
//crossAxisAlignment为纵轴方向
//mainAxisAlignment为主轴方向
//Column 主轴为垂直方向 纵轴为水平 Row相反
//mainAxisSize 为主轴大小
//textDirection 为文本描述方向,默认是从左到右, textDirection.lft 为从左到右 textDirection.right 为从右到左
//verticalDirection 纵轴对齐方向
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
//      verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("mainAxisAlignment: MainAxisAlignment.center"),
              Text("I am Jack")
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("mainAxisSize: MainAxisSize.min"),
              Text("I am Jack")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("textDirection: TextDirection.rtl"),
              Text("i am Jack")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("crossAxisAlignment: CrossAxisAlignment.start"),
              Text("i am Jack")
            ],
          )
        ],
      ),
    );
  }
}
