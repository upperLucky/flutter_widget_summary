import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic_component/widget_column.dart';
import 'package:flutter_widget_summary/basic_component/widget_image.dart';
import 'package:flutter_widget_summary/basic_component/widget_row.dart';
import 'package:flutter_widget_summary/basic_component/widget_container.dart';

/// 单一格式的文本
class WidgetText extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
  textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget本身。
  本例中虽然是指定了居中对齐，但因为Text文本内容宽度不足一行，Text的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，
  只有Text宽度大于文本内容长度时指定此属性才有意义

  maxLines、overflow：指定文本显示的最大行数，默认情况下，文本是自动折行的，如果指定此参数，则文本最多不会超过指定的行。
  如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断，本例中指定的截断方式TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示
  
  textScaleFactor：代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，它是调整字体大小的一个快捷方式。
  该属性的默认值可以通过MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0。



  TextStyle用于指定文本显示的样式如颜色、字体、粗细、背景等。
  height：该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。

  fontFamily ：由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下。




  在Widget树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用Widget树中父级设置的默认样式），
  因此，如果在Widget树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式，而DefaultTextStyle正是用于设置默认文本样式的
  该节点下的所有子孙Text默认都会继承该样式，除非Text显示指定不继承样式
 */
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DefaultTextStyle(
          style: TextStyle(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildText(),
              Text('DefaultTextStyle'),
              Text(
                'NoDefaultTextStyle',
                style: TextStyle(inherit: false, color: Colors.blue), // 不继承样式
              )
            ],
          ),
        ));
  }

  Text buildText() {
    return Text(
      'Hello, *** , How are you',
      style: TextStyle(
          fontSize: 20, color: Colors.red, height: 2, fontFamily: 'Courier'),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 2.0,
    );
  }

  /*
      使用Text.rich 构造方法，配合TextSpan实现对一个Text的不同部分按照不同的样式显示
   */
  Text buildTextWithRich() {
    return Text.rich(TextSpan(text: 'Hello World', children: <TextSpan>[
      TextSpan(text: ' With', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(
          text: ' you',
          style:
              TextStyle(color: Colors.amberAccent, fontStyle: FontStyle.normal))
    ]));
  }
}
