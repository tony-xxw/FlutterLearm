import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewSample extends StatefulWidget {
  @override
  _CustomScrollViewSample createState() => _CustomScrollViewSample();
}

class _CustomScrollViewSample extends State<CustomScrollViewSample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollViewTestRoute(),
    );
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,//滚动appbar是否可以见
            expandedHeight: 250,//展开高度
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//gird 每行个数
                  mainAxisSpacing: 10,//主轴最大间距
                  crossAxisSpacing: 10,//纵轴最大间距
                  childAspectRatio: 4),//主轴与纵轴的比例
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              }, childCount: 20),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("list item $index"),
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
