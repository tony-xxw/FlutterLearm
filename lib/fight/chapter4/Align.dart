import 'package:flutter/material.dart';

void main() => runApp(AlignPage());

class AlignPage extends StatelessWidget {
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
      appBar: AppBar(),
      body: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("topRight"),
              Container(
                width: 120,
                height: 120,
                color: Colors.blue[50],
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Text("bottomLeft"),
              Container(
                color: Colors.blue[50],
                child: Align(
                  //当父容器没有设置宽高,可以通过factor因子设置子组件大小的倍数为容器大小
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.bottomLeft,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Text("Alignment"),
              Container(
                color: Colors.blue[50],
                child: Align(
                  //Center组件为Align子类,如果width/heightFactor未设置,则子组件会占满空间
                  widthFactor: 2,
                  heightFactor: 2,
                  //坐标原点为 矩形中心
                  //通过alignment的计算公式,可以得出子组件偏离位置
                  //公式: (alignment.x * childWidth/2 + childWidth /2),(alignment*y * childHeight/2 + childHeight/2)
                  alignment: Alignment(2, 0),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Text("FactionalOffset"),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  //坐标原点为左上角
                  //计算公式为: fraction.x  * childWith , fraction.y * childHeight
                  alignment: FractionalOffset(0.2, 0.6),
                  //120* 0.2 = 24 120*0.6 = 72
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

  }
}
