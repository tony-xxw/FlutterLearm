import 'package:flutter/material.dart';

void main() => runApp(new WarpWithFlow());

class WarpWithFlow extends StatelessWidget {
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
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 20,
            runSpacing: 4,
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Chip(
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
                label: Text('Lafayette'),
              ),
              Chip(
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
                label: Text('Mulligan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
