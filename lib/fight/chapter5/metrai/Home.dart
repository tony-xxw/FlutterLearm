import 'package:flutter/material.dart';

import 'ScaffoldSample.dart';

void main() => runApp(MeterDesignPage());

class MeterDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MeterDesign 风格容器",
      routes: {
        "scaffold": (context) => ScaffoldRouter(),
        '/': (context) => HomePage(
              title: "MeterDesign 风格容器",
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
              child: Text("Scaffold"),
              onPressed: () {
                Navigator.pushNamed(context, "scaffold");
              },
            ),
            FlatButton(
              child: Text("Tab"),
            ),
            FlatButton(
              child: Text("底部导航"),
            )
          ],
        ),
      ),
    );
  }
}
