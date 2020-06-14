import 'package:flutter/material.dart';

void main() => runApp(PaddingPage());

class PaddingPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text("Padding组件,装饰组件"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text("EdgeInsets.only"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("EdgeInsets.symmetric"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(" EdgeInsets.fromLTRB"),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 4)
                  ]),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
