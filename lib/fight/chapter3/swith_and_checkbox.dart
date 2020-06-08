import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SwithAndCheckbox());

class SwithAndCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePageRouter(),
    );
  }
}

class HomePageRouter extends StatefulWidget {
  @override
  _HomePageRouter createState() {
    // TODO: implement createState
    return _HomePageRouter();
  }
}

class _HomePageRouter extends State<HomePageRouter> {
  bool _switchSelected = true;
  bool _checkboxSelect = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelect,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkboxSelect = value;
              });
            },
          )
        ],
      ),
    );
  }
}
