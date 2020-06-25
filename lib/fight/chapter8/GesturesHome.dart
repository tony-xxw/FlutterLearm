import 'package:flutter/material.dart';

class GestureHome extends StatefulWidget {
  @override
  _GestureHome createState() {
    return _GestureHome();
  }
}

class _GestureHome extends State<GestureHome> {
  //保存事件名
  String _opration = "No Gesture detected";
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  double _top2 = 0.0;
  double _width = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势操作"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 600,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: 100,
                      height: 50,
                      child: Text(
                        _opration,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () => updateText("Tap"), //点击
                    onDoubleTap: () => updateText("double"), //双击
                    onLongPress: () => updateText("long"), //长按
                  ),
                  SizedBox(
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: _top,
                          left: _left,
                          child: GestureDetector(
                            child: CircleAvatar(
                              child: Text("A"),
                            ),
                            onPanDown: (DragDownDetails e) {
                              print("用户手机按下${e.globalPosition}");
                            },
                            onPanUpdate: (DragUpdateDetails e) {
                              setState(() {
                                _left += e.delta.dx;
                                _top += e.delta.dy;
                              });
                            },
                            onPanEnd: (DragEndDetails e) {
                              print(e.velocity);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: _top2,

                          left: _left,
                          child: GestureDetector(
                            child: CircleAvatar(
                              child: Text("A"),
                            ),
                            onHorizontalDragUpdate:
                                (DragUpdateDetails details) {
                              setState(() {
                                _left += details.delta.dx;
                              });
                            },
                            onVerticalDragUpdate: (DragUpdateDetails e) {
                              setState(() {
                                _top2 += e.delta.dy;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: GestureDetector(
                      child: Image.asset(
                        "images/avatar.png",
                        width: _width,
                      ),
                      onScaleUpdate: (ScaleUpdateDetails e) {
                        setState(() {
                          _width = 200 * e.scale.clamp(.8, 10);
                        });
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _opration = text;
    });
  }
}
