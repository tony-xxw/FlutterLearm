import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Router"),
      ),
      body: Center(child: Text("This is new Router")),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IntentRouter extends StatelessWidget {
  IntentRouter({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () async {
//          var result = await Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return TipRoute(
//                  text: "我是提示xxx",
//                );
//              }));
          //适配路由传参
          var result =
              await Navigator.pushNamed(context, "tip2", arguments: "路由传参");
          print("路由返回值: $result");
        },
        child: Text(title),
      ),
    );
  }
}

class RouteArgument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("路由传参"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}

class RandomWidget extends StatelessWidget {
  final wordRad = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(wordRad.toString()),
    );
  }
}
