import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic_component/widget_column.dart';
import 'package:flutter_widget_summary/basic_component/widget_icon.dart';
import 'package:flutter_widget_summary/basic_component/widget_image.dart';
import 'package:flutter_widget_summary/basic_component/widget_material_button.dart';
import 'package:flutter_widget_summary/basic_component/widget_row.dart';
import 'package:flutter_widget_summary/basic_component/widget_container.dart';
import 'package:flutter_widget_summary/basic_component/widget_text.dart';

void main() => runApp(WidgetButton());

class WidgetFlutterLogo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget FlutterLogo',
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
      home: MyHomePage(title: 'Widget FlutterLogo'),
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
        child: FlutterLogo(
          colors: Colors.red,
          size: 200,
          textColor: Colors.blue,
          style: FlutterLogoStyle.horizontal,
        ),
      ),
    );
  }
}
