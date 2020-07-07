import 'package:flutter/material.dart';
import 'package:helloflutter/project/common/style/wynne_style.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static var sErrorStack = new List<Map<String, dynamic>>();
  static var sErrorName = new List();

  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return Container(
      color: WynneColors.primaryValue,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              gradient: RadialGradient(
                  tileMode: TileMode.mirror,
                  radius: 0.1,
                  colors: [
                    Colors.white.withAlpha(10),
                    WynneColors.primaryValue.withAlpha(100)
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(width / 2))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(WynneICons.DEFAULT_IMAGE),
                width: 90.0,
                height: 90.0,
              ),
              SizedBox(
                height: 11,
              ),
              Material(
                child: Text(
                  "Error Occur",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                color: WynneColors.primaryValue,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: WynneColors.white.withAlpha(100),
                    onPressed: (){
                      String content = widget.errorMessage;
                      textEditingController.text = content;
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
