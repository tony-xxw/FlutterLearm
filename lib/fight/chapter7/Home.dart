import 'package:flutter/material.dart';

import 'Intercept.dart';

void main() => runApp(MeterDesignPage());

class MeterDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MeterDesign 风格容器",
      routes: {
        "intercept": (context) => Intercept(),
        '/': (context) => HomePage(
              title: "功能性组件",
            )
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("返回拦截"),
              onPressed: () {
                Navigator.pushNamed(context, "single");
              },
            ),
          ],
        ),
      ),
    );
  }
}
