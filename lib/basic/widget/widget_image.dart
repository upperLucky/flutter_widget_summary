import 'package:flutter/material.dart';

/// 一个显示图片的widget
/// Flutter框架对加载过的图片是有缓存的（内存），默认最大缓存数量是1000，最大缓存空间为100M

class WidgetImage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
 */

class _MyHomePageState extends State<WidgetImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: <Image>[
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.fill,
            ),
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.contain,
            ),
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            /*
              color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式
             */
            Image.network(
              'http://www.devio.org/img/avatar.png',
              width: 100,
              height: 200,
              fit: BoxFit.none,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            )
          ].map((e) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString())
              ],
            );
          }).toList()),
        ));
  }
}
