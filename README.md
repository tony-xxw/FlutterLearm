# FlutterLearn

Flutter 学习



```
模板代码
void main() => runApp(SamplePage());

class SamplePage extends StatelessWidget {
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
        title:Text("模板")
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
```