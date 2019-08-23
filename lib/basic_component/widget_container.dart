import 'package:flutter/material.dart';

/// Container 一个拥有绘制，定位，调整大小的 widget

class WidgetContainer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Container',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Widget Container'),
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
        body: buildContainer());
  }

  Center buildCenter() {
    return Center(
      child: Container(
        color: Colors.amber,
        width: 48,
        height: 48,
        margin: EdgeInsets.all(
            10), // 虽然 Container 被 Center 包裹，但是 margin 和 padding 的值还是一样会影响它的位置
      ),
    );
  }

  Container buildContainer() {
    return Container(
      // BoxConstraints用于设置限制条件
      // const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints

      /*
          TextTheme 一些属性值
          The 2018 spec has thirteen text styles:
          NAME         SIZE  WEIGHT  SPACING
          headline1    96.0  light   -1.5
          headline2    60.0  light   -0.5
          headline3    48.0  normal   0.0
          headline4    34.0  normal   0.25
          headline5    24.0  normal   0.0
          headline6    20.0  medium   0.15
          subtitle1    16.0  normal   0.15
          subtitle2    14.0  medium   0.1
          body1        16.0  normal   0.5
          body2        14.0  normal   0.25
          button       14.0  medium   0.75
          caption      12.0  normal   0.4
          overline     10.0  normal   1.5


          2018版与2014的对比变换
          NAME       SIZE   WEIGHT   SPACING  2018 NAME
          display4   112.0  thin     0.0      headline1
          display3   56.0   normal   0.0      headline2
          display2   45.0   normal   0.0      headline3
          display1   34.0   normal   0.0      headline4
          headline   24.0   normal   0.0      headline5
          title      20.0   medium   0.0      headline6
          subhead    16.0   normal   0.0      subtitle1
          body2      14.0   medium   0.0      body1
          body1      14.0   normal   0.0      body2
          caption    12.0   normal   0.0      caption
          button     14.0   medium   0.0      button
          subtitle   14.0   medium   0.0      subtitle2
          overline   10.0   normal   0.0      overline
       */
      constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200),
      padding: EdgeInsets.all(8),
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('Hello World',
          // 等价于 TextStyle(fontSize: 34,color: Colors.white)
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white)),
      // Matrix4是一个4D矩阵  沿Z轴旋转0.1弧度
      transform: Matrix4.rotationZ(0.1),
    );
  }
}
