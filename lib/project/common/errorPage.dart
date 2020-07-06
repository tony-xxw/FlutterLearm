import 'package:flutter/material.dart';

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

  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
