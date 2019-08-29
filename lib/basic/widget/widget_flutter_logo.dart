import 'package:flutter/material.dart';

class WidgetFlutterLogo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WidgetFlutterLogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterLogo'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
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
