import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GirdViewSample extends StatefulWidget {
  @override
  _GirdViewSampleSample createState() => _GirdViewSampleSample();
}

class _GirdViewSampleSample extends State<GirdViewSample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("GirdView"),
      ),
      body: GridView.extent(
          maxCrossAxisExtent: 60,
          childAspectRatio: 2,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ]),
//      body: GridView.count(
//        crossAxisCount: 3,
//        childAspectRatio: 1,
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.airport_shuttle),
//          Icon(Icons.all_inclusive),
//          Icon(Icons.beach_access),
//          Icon(Icons.cake),
//          Icon(Icons.free_breakfast),
//        ],
//      ),
    );
  }
}
