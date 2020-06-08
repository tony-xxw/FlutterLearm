# FlutterLearn

Flutter 学习



```
模板代码
void main() => runApp(SwithAndCheckbox());

class SwithAndCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
```