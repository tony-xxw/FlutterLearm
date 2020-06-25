import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new ImageWithIcon());

class ImageWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO:
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO:
    return Scaffold(
      appBar: AppBar(
        title: Text("图片与Icon"),
      ),
      body: Column(
        children: <Widget>[IconFoc(), ImageFoc()],
      ),
    );
  }
}

class ImageFoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO:
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
            ),
            //加载网络
            Image(
              image: NetworkImage(
                  "http://cdn.2haohr.com/ios/img/meeting/tab_nav1_active.png"),
              width: 100,
            ),
            //加载网络简写
            Image.network(
              "http://cdn.2haohr.com/ios/img/meeting/tab_nav1_active.png",
              width: 100,
              color: Colors.orange,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            //color .colorBlendMode
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            //repeat
            Image(
              image: AssetImage("images/avatar.png"),
              width: 250,
              height: 200,
              repeat: ImageRepeat.repeatX,
            ),
          ],
        ),
        //加载本地
        Row(
          children: <Widget>[
            Image(
              image: AssetImage("images/avatar.png"),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 20,
              height: 100,
              fit: BoxFit.cover,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width:60,
              fit: BoxFit.contain,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 40,
              height: 60,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 50,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 50,
              height: 100,
              fit: BoxFit.none,
            )
          ],
        )
        //fit
      ],
    );
  }
}

class IconFoc extends StatelessWidget {
  String obtainIcons() {
    String icons = "\uE914";
    icons += "\uE000";
    icons += "\uE90D";
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          obtainIcons(),
          style: TextStyle(
              fontFamily: "MaterialIcons", fontSize: 24, color: Colors.green),
        )
      ],
    );
  }
}
