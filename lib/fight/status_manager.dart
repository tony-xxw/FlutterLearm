import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new StatusManager());

class StatusManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "状态管理",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StatusHome(),
    );
  }
}

class StatusHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: Column(
        children: <Widget>[SelfManager(), ParentManager(),HybridWidget()],
      ),
    );
  }
}

class SelfManager extends StatefulWidget {
  SelfManager({Key key}) : super(key: key);

  @override
  _SelfManager createState() => new _SelfManager();
}

class _SelfManager extends State<SelfManager> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentManager extends StatefulWidget {
  ParentManager({Key key}) : super(key: key);

  @override
  _ParentManager createState() => new _ParentManager();
}

class _ParentManager extends State<ParentManager> {
  bool _active = false;

  void handleActive(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
     return ChildManger(
      active: _active,
      onChange: handleActive,
    );
  }
}

class ChildManger extends StatelessWidget {
  ChildManger({Key key, this.active: false, @required this.onChange})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  void _handleTap() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
            child: Text(
              active ? "Active" : "InActive",
              style: TextStyle(fontSize: 32, color: Colors.blue),
            )),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}




class HybridWidget extends StatefulWidget {
  @override
  _ParentWidget createState() => new _ParentWidget();
}

class _ParentWidget extends State<HybridWidget> {
  bool _active = false;

  void _handleChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new ChildWidget(active: _active, onChange: _handleChange,),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget({Key key, this.active, @required this.onChange})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChange;

  @override
  _ChildWidgetState createState() => new _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? "active" : "inActive", style: TextStyle(
              fontSize: 32, color: Colors.white)),

        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight ? new Border.all(
                color: Colors.teal[700], width: 1) : null
        ),
      ),
    );
  }
}
