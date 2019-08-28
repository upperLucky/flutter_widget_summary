import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic_component/widget_column.dart';
import 'package:flutter_widget_summary/basic_component/widget_image.dart';
import 'package:flutter_widget_summary/basic_component/widget_row.dart';
import 'package:flutter_widget_summary/basic_component/widget_container.dart';
import 'package:flutter_widget_summary/basic_component/widget_text.dart';

/// A Material Design icon.

class WidgetIcon extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
“字体图标”，它是将图标做成字体文件，然后通过指定不同的字符而显示不同的图片。

  在Flutter开发中，iconfont和图片相比有如下优势：

  1.体积小：可以减小安装包大小。
  2.矢量的：iconfont都是矢量图标，放大不会影响其清晰度。
  3.可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等。
  4.可以通过TextSpan和文本混用。

 */

class _MyHomePageState extends State<WidgetIcon> {
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
          Icon(Icons.account_box, color: Colors.red, size: 50),
        ]));
  }
}

class MyIcons {
  // book 图标
  static const IconData book =
      const IconData(0xe614, fontFamily: 'myIcon', matchTextDirection: true);

  // 微信图标
  static const IconData wechat =
      const IconData(0xec7d, fontFamily: 'myIcon', matchTextDirection: true);
}
