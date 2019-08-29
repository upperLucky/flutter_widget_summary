import 'package:flutter/material.dart';

class ResPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: Image.asset(
          'images/view.png',
          width: 100,
          height: 100,
        )),
        Expanded(
            child: Image(
          image: AssetImage('images/view.png'),
        ))
      ]),
    );
  }
}
