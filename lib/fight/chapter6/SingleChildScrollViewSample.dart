import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewSample extends StatefulWidget {
  @override
  _SingleChildScrollViewSampleSample createState() =>
      _SingleChildScrollViewSampleSample();
}

class _SingleChildScrollViewSampleSample
    extends State<SingleChildScrollViewSample> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("SingleView"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((e) => Text(
                        e,
                        textScaleFactor: 2,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
