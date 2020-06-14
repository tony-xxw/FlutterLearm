import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(TransformPage());

class TransformPage extends StatelessWidget {
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
      appBar: AppBar(title: Text("TransForm(补间动画)")),
      body: Column(
        children: <Widget>[
          Text("Transfrom.的平移是在绘制阶段"),
          Text("平移"),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(-20, -10),
              child: Text("水平向左平移20,垂直向上平移-10"),
            ),
          ),
          Text("旋转"),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("旋转180°"),
            ),
          ),
          Text("缩放"),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: Transform.scale(
              scale: 1.5,
              child: Text("放大1.5倍"),
            ),
          ),
          Text("layout 阶段 的Rote"),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text("layout阶段旋转"),
            ),
          )
        ],
      ),
    );
  }
}
