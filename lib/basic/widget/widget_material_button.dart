import 'package:flutter/material.dart';

///Material组件库中的按钮

class WidgetButton extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
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
