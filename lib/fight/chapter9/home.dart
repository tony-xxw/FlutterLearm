import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/fight/chapter9/Hero.dart';

import 'AnimationStructure.dart';
import 'StaggerAnimation.dart';

void main() => runApp(Chapter9());

class Chapter9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        'structure': (context) => AnimationsStructure(),
        'hero': (context) => HeroAnimation(),
        'stagger': (context) => StaggerRoute(),
        '/': (context) => HomeChapter9(),
      },
    );
  }
}

class HomeChapter9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter9"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "structure");
                },
                child: Text(
                  "动画结构",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AnimationsStructure(),
                      ));
                },
                child: Text(
                  "IOS切换页面风格动画",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(microseconds: 500),
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: AnimationsStructure(),
                            );
                          }));
                },
                child: Text("自定义切换风格动画"),
              ),
              RaisedButton(
                child: Text(
                  "Hero动画",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "hero");
                },
              ),
              RaisedButton(
                child: Text(
                  "交织动画",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "stagger");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
