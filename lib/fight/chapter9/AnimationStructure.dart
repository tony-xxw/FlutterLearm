import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationsStructure extends StatefulWidget {
  @override
  _AnimationStructure createState() => _AnimationStructure();
}

class _AnimationStructure extends State<AnimationsStructure>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animatedContainer;

  @override
  void initState() {
    super.initState();
    animatedContainer =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        CurvedAnimation(parent: animatedContainer, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animatedContainer.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animatedContainer.forward();
      }
    });
    animatedContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
      body: Center(
        child: Image.asset("images/avatar.png",
            width: animation.value, height: animation.value),
      ),
    );
  }

  @override
  void dispose() {
    animatedContainer.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimation extends State<AnimationsStructure>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
