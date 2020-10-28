import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    print("updateShouldNotify oldWidget: ${oldWidget.data}  data: $data");
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidget createState() => __TestWidget();
}

class __TestWidget extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
     return Text(ShareDataWidget.of(context).data.toString());
    // return Text("text");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRoute createState() => _InheritedWidgetTestRoute();
}

class _InheritedWidgetTestRoute extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _TestWidget(),
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
