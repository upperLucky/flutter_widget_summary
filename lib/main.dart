import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic/other/gesture_page.dart';
import 'package:flutter_widget_summary/basic/widget/widget_column.dart';
import 'package:flutter_widget_summary/basic/widget/widget_container.dart';
import 'package:flutter_widget_summary/basic/widget/widget_flutter_logo.dart';
import 'package:flutter_widget_summary/basic/widget/widget_icon.dart';
import 'package:flutter_widget_summary/basic/widget/widget_image.dart';
import 'package:flutter_widget_summary/basic/widget/widget_material_button.dart';
import 'package:flutter_widget_summary/basic/widget/widget_placeholder.dart';
import 'package:flutter_widget_summary/basic/widget/widget_row.dart';
import 'package:flutter_widget_summary/basic/widget/widget_scaffold.dart';
import 'package:flutter_widget_summary/basic/widget/widget_text.dart';

import 'basic/other/res_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        'container': (BuildContext context) => WidgetContainer(),
        'row': (BuildContext context) => WidgetRow(),
        'column': (BuildContext context) => WidgetColumn(),
        'image': (BuildContext context) => WidgetImage(),
        'text': (BuildContext context) => WidgetText(),
        'icon': (BuildContext context) => WidgetIcon(),
        'button': (BuildContext context) => WidgetButton(),
        'placeholder': (BuildContext context) => WidgetPlaceHolder(),
        'flutterlogo': (BuildContext context) => WidgetFlutterLogo(),
        'scaffold': (BuildContext context) => WidgetScaffold(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
        ),
        body: ListView(
          children: <Widget>[
            SwitchListTile(
                value: byName,
                title: Text('${byName ? "" : '不'}通过路由名跳转'),
                onChanged: (value) {
                  setState(() {
                    byName = value;
                  });
                }),
            _itemClick('Container', WidgetContainer(), 'container'),
            _itemClick('Row', WidgetRow(), 'row'),
            _itemClick('Column', WidgetColumn(), 'column'),
            _itemClick('Image', WidgetImage(), 'image'),
            _itemClick('Text', WidgetText(), 'text'),
            _itemClick('Icon', WidgetIcon(), 'icon'),
            _itemClick('Button', WidgetButton(), 'button'),
            _itemClick('Placeholder', WidgetPlaceHolder(), 'placeholder'),
            _itemClick('Flutterlogo', WidgetFlutterLogo(), 'flutterlogo'),
            _itemClick('Scaffold', WidgetScaffold(), 'scaffold'),
            _itemClick('Gesture', GesturePage(), 'geusture'),
            _itemClick('Res', ResPage(), 'res'),
          ],
        ));
  }

  /// 路由的两种方式
  _itemClick(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
