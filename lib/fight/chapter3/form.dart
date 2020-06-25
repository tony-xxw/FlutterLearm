import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormStatePage extends StatefulWidget {
  @override
  FormPage createState() => FormPage();
}

class FormPage extends State<FormStatePage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerDefault = TextEditingController();

  GlobalKey _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("表单")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _controllerDefault,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于五位数";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              print("校验通过 ${_formKey.currentState}");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
