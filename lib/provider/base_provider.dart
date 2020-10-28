import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InheritedProvider<T> extends InheritedWidget {


  final T data;

  InheritedProvider({@required this.data, Widget child}) :super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    print("updateShouldNotify");
    return true;
  }
}


class WChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  WChangeNotifierProvider({Key key, this.data, this.child});


  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<
        InheritedProvider<T>>();
    return provider.data;
  }

  @override
  _ChangeNotifierProvider<T> createState() => _ChangeNotifierProvider<T>();
}

class _ChangeNotifierProvider<T extends ChangeNotifier>
    extends State<WChangeNotifierProvider> {

  void update() {
    // setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider <T>(data: widget.data, child: widget.child);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WChangeNotifierProvider<ChangeNotifier> oldWidget) {
    print("didUpdateWidget");
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

}