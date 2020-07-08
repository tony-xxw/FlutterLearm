import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloflutter/project/common/event/http_error_event.dart';
import 'package:helloflutter/project/common/event/index.dart';
import 'package:helloflutter/project/common/localization/default_localization.dart';

import 'common/net/code.dart';

class FlutterReduxApp extends StatefulWidget {
  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();

}

class _FlutterReduxAppState extends State<FlutterReduxApp>
    with HttpErrorListener {

  @override
  Widget build(BuildContext context) {
    return null;
  }

}

mixin HttpErrorListener on State<FlutterReduxApp>{
  StreamSubscription stream;

  BuildContext _context;

  @override
  void initState() {
    super.initState();

    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error);
        break;
      case 401:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_401);
        break;
      case 403:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_403);
        break;
      case 404:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_404);
        break;
      case 422:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_422);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_timeout);
        break;
      case Code.GITHUB_API_REFUSED:
      //Github API 异常
        showToast(XXWLocalizations
            .i18n(_context)
            .github_refused);
        break;
      default:
        showToast(XXWLocalizations
            .i18n(_context)
            .network_error_unknown +
            " " +
            message);
        break;
    }
  }


  showToast(String message) {
    Fluttertoast.showToast(msg: message,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG)
  }


}