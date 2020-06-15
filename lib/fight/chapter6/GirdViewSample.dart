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
      body: InfiniteGridView(),
//      body: GridView.extent(
//          maxCrossAxisExtent: 60,
//          childAspectRatio: 2,
//          children: <Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast),
//          ]),
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

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridView createState() => _InfiniteGridView();
}

class _InfiniteGridView extends State<InfiniteGridView> {
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  void _retrieveIcons() {
    Future.delayed(Duration(microseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
