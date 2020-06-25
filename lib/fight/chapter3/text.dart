import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "文本",
      home: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  void _tapRecognizer() {
    print("_tapRecognizer");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本,字体样式"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Text(
                "HelloWorld",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "HelloWorld",
                textScaleFactor: 1.5,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "HelloWorld" * 6,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "HelloWorld" * 6,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "HelloWorld",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Home:"),
                  TextSpan(
                      text: "https:www.baidu.com",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("TapGestureRecognizer");
                        }),
                ]))),
          ],
        ),
      ),
    );
  }
}
