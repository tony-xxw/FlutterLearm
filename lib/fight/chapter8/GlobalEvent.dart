import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件总线"),
      ),
      body: Center(),
    );
  }
}

typedef void EventCallBack(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = new EventBus._internal();

  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallBack>>();

  void on(eventName, EventCallBack f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallBack>();

    _emap[eventName].add(f);
  }

  void off(eventName, [EventCallBack f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

  var bus = new EventBus();
}
