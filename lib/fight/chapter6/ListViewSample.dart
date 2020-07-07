import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewSample extends StatefulWidget {
  @override
  _ListViewSampleSample createState() => _ListViewSampleSample();
}

class _ListViewSampleSample extends State<ListViewSample> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 24 - 56 - 56,
        child: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                if (_words[index] == loadingTag) {
                  if (_words.length - 1 < 100) {
                    _retrieveData();
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
//                      child: SizedBox(
//                        width: 24,
//                        height: 24,
//                        child: CircularProgressIndicator(
//                          strokeWidth: 2,
//                        ),
                      child: Image(
                        image: AssetImage("images/xxxw.png"),
                        width: 200,
                      ),
                    );
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
                return ListTile(title: Text(_words[index]));
              },
              separatorBuilder: (context, index) => Divider(
                    height: 0,
                  ),
              itemCount: _words.length),
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
