import 'dart:math';

import 'package:flutter/material.dart';

class AsyncApiPage extends StatelessWidget {
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
      appBar: AppBar(title: Text("异步 API")),
      body: Column(
        children: <Widget>[FutureWidget(), StreamWidget()],
      ),
    );
  }
}

class FutureWidget extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "网上数据");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error :${snapshot.error}");
            } else {
              return Text("Contents :${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class StreamWidget extends StatelessWidget {
  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counter(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) return Text("error ${snapshot.error}");
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("没有Stream");
          case ConnectionState.waiting:
            return Text("没有数据");
          case ConnectionState.active:
            return Text("active ${snapshot.data}");
          case ConnectionState.done:
            return Text("stream关闭");
        }
        return null;
      },
    );
  }
}
