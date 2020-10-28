import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/fight/chapter7/ShareDataWidget.dart';
import 'package:helloflutter/provider/car.dart';
import 'package:helloflutter/provider/name_model.dart';
import 'package:provider/provider.dart';

import 'base_provider.dart';

void main() => runApp(ProviderSample());

class ProviderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(child: ProviderRouter()),
      ),
    );
  }
}

class ProviderRouter extends StatefulWidget {
  @override
  _ProviderRouterState createState() => _ProviderRouterState();
}

class _ProviderRouterState extends State<ProviderRouter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Builder(builder: (context) {
                    print("reset build");
                    var cart = WChangeNotifierProvider.of<CartModel>(context);
                    return Text("总价为${cart.totalPrice}");
                  }),
                  Builder(builder: (context) {
                    return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          WChangeNotifierProvider.of<CartModel>(context)
                              .add(Item(1, 20.0));
                        });
                  })
                ],
              );
            },
          )),
    );
  }
}

class NameGame extends StatelessWidget {
  final name = NameModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            left: 0,
            child: Column(
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
            )),
        Positioned(child: null)
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
