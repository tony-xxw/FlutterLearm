import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/provider/name_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProviderSample());

class ProviderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(child: NameGame()),
      ),
    );
  }
}

class NameGame extends StatelessWidget {
  final name = NameModel();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Provider<String>.value(
          child: ChangeNotifierProvider.value(
            value: name,
            child: Column(
              children: <Widget>[Welcome(), RandomName()],
            ),
          ),
        ),
        TestOther()
      ],
    );
  }
}

class TestOther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("其他组件");
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<NameModel>(context);
    return Text(_name.value);
  }
}

class RandomName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<NameModel>(context);
    return FlatButton(
      child: Text(_name.value),
      onPressed: () => _name.changeName(),
    );
  }
}
