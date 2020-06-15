import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScrollControllerTestRouter();
  }
}

class ScrollControllerTestRouter extends StatefulWidget {
  @override
  _ScrollControllerTestRouter createState() => _ScrollControllerTestRouter();
}

class _ScrollControllerTestRouter extends State<ScrollControllerTestRouter> {
  ScrollController _controller = new ScrollController();
  bool showToToBtn = false; //返回顶部
  String _progress = "0%";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //position
      if (_controller.offset < 1000 && showToToBtn) {
        setState(() {
          //恢复默认
          showToToBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToToBtn) {
        setState(() {
          showToToBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notifation) {
          double program = notifation.metrics.pixels / notifation.metrics.maxScrollExtent;

          setState(() {
            _progress = "${(program * 100).toInt()}%";
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                }),
            CircleAvatar(
              radius: 30,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      )),
      floatingActionButton: !showToToBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(microseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
