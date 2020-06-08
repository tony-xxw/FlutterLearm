import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fultter Demo",
      initialRoute: "/",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        //路由表 key:value  key为路由名,value 会构造widget的回调函数
        "new_router": (context) => NewRouter(),
        "router_argument": (context) => RouteArgument(),
        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "/": (context) => MyHomePage(title: "Flutter Demo Home Page")
      },
//      home: MyHomePage(title: "Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    //只有第一次插入到 Widget树中才会调用
    print("initState");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
     super.didUpdateWidget(oldWidget);
     //framework层会调用canUpdate,canUpdate会在新旧widget的key与runType一样会调用
     print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    //当widget从树中被移除会回调
    print("deactivate");

  }
  @override
  void dispose() {
    super.dispose();
    //当State对象从树中永久移除时调用
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    //专门用于开发,release环境不会被调用
    print("reassemble");

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //State对象依赖发生改变时会被调用
    print("didChangeDependencies");
  }


  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You Have Pushed the button this many times"),
            Text(
              "$_count",
              style: Theme.of(context).textTheme.headline,
            ),
            FlatButton(
              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return NewRouter();
//                }));
                //通过路由名来跳转
                Navigator.pushNamed(context, "new_router");
              },
              child: Text("打开新页面"),
              textColor: Colors.blue,
            ),
            IntentRouter(title: "传值"),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "router_argument",
                    arguments: "路由传过来的值: vlaue");
              },
              child: Text("路由传参"),
            ),
            RandomWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
