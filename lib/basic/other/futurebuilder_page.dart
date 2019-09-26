import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PageDemo extends StatefulWidget {
  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  Future<CommonModel> testFuture() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();

    final result = json.decode(utf8decoder.convert(response.bodyBytes)); // 中文乱码解决方式
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder'),
        ),
        body: FutureBuilder(
            future: testFuture(),
            builder:
                // ignore: missing_return
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Input a URL to start');

                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return new Column(children: <Widget>[
                      Text('icon:${snapshot.data.icon}'),
                      Text('statusBarColor:${snapshot.data.statusBarColor}'),
                      Text('title:${snapshot.data.title}'),
                      Text('url:${snapshot.data.url}')
                    ]);
                  }
              }
            }),
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
