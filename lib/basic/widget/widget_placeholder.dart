import 'package:flutter/material.dart';

/// Placeholder 占位符,代表之后会有widget放置其中

class WidgetPlaceHolder extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WidgetPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlaceHolder'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Placeholder(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
