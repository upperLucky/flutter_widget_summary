import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开第三方应用
class LaunchPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LaunchPage> {
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
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () => _launchURL(),
              child: Text('打开浏览器'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => _openMap(),
              child: Text('打开地图'),
            ),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    // Android
    const url = 'geo:52.32,4.917'; // APP提供者提供的 schema
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // iOS
      const url = 'http://maps.apple/com/?ll=52.32,4.917'; // APP提供者提供的 schema
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
