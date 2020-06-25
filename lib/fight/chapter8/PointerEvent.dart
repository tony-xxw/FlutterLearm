import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointEvent extends StatefulWidget {
  @override
  PointEventState createState() => PointEventState();
}

class PointEventState extends State<PointEvent> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Listener(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: 400,
                    height: 150,
                    child: Text(
                      _event?.toString() ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPointerUp: (PointerUpEvent event) {
                    setState(() => _event = event);
                  },
                  onPointerMove: (PointerMoveEvent event) {
                    print("onPointerMove position  ${event.position}");
                    print("onPointerMove delta  ${event.delta}");
                    print("onPointerMove pressure  ${event.pressure}");
                    print("onPointerMove orientation  ${event.orientation}");
                    setState(() => _event = event);
                  },
                  onPointerDown: (PointerDownEvent event) {
                    print("onPointerDown position  ${event.position}");
                    print("onPointerDown delta  ${event.delta}");
                    print("onPointerDown pressure  ${event.pressure}");
                    print("onPointerDown orientation  ${event.orientation}");
                    setState(() => _event = event);
                  }),
              Stack(
                children: <Widget>[
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300, 200)),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.orange),
                      ),
                    ),
                    onPointerDown: (event) => print("down0"),
                  ),
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(200, 100)),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text("左上角200*100 范围内非文本区域点击"),
                        ),
                      ),
                    ),
                    onPointerDown: (event) => print(("dwon1")),
//                    behavior: HitTestBehavior.translucent,
//                    behavior: HitTestBehavior.opaque,
//                    behavior: HitTestBehavior.deferToChild,
                  )
                ],
              ),
              Listener(
                child: IgnorePointer(
                  child: Listener(
                    child: Container(
                      color: Colors.purple,
                      width: 200,
                      height: 100,
                    ),
                    onPointerDown: (event) => print("in"),
                  ),
                ),
                onPointerDown: (event) => print("up"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
