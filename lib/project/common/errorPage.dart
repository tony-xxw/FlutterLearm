import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  var sErrorStack = new List<Map<String, dynamic>>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
