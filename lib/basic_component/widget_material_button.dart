import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic_component/widget_column.dart';
import 'package:flutter_widget_summary/basic_component/widget_icon.dart';
import 'package:flutter_widget_summary/basic_component/widget_image.dart';
import 'package:flutter_widget_summary/basic_component/widget_row.dart';
import 'package:flutter_widget_summary/basic_component/widget_container.dart';
import 'package:flutter_widget_summary/basic_component/widget_text.dart';

///Material组件库中的按钮
class WidgetButton extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Button',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Widget Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// RaisedButton  默认带有阴影和灰色背景。按下后，阴影会变大
            RaisedButton(
              child: Text('Disable Button'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Enable Button'),
              onPressed: () {},
            ),
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.all(0.0),
              child: Container(
                // 渐变颜色
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ])),
                padding: EdgeInsets.all(10.0),
                child: Text('Gradint Button'),
              ),
            ),

            /// icon 构造函数，通过它可以轻松创建带图标的按钮
            RaisedButton.icon(
                onPressed: () {}, icon: Icon(Icons.book), label: Text('Book')),

            /// FlatButton 默认背景透明并不带阴影。按下后，会有背景色
            FlatButton(
              onPressed: () {},
              child: Text('FlatButton'),
            ),

            /// OutlineButton  默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
            OutlineButton(
              onPressed: () {},
              child: Text('OutlineButton'),
              highlightedBorderColor: Colors.red,
            ),

            /// 是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
            IconButton(
              icon: Icon(Icons.sentiment_satisfied),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
