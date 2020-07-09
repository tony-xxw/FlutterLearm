import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(FloatingBottom());

class FloatingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("底部凹陷"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), title: Text("add")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.delete), title: Text("delete")),
            ],
          ),
        ),
      ),
    );
  }
}
