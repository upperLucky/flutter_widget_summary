import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;

    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'value:' + animation.value.toString(),
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 10),
            ),
            Text('status:' + animation.status.toString(),
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10)),
            Container(
              width: animation.value,
              height: animation.value,
              child: FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedLogoPage extends StatefulWidget {
  @override
  _AnimatedLogoPageState createState() => _AnimatedLogoPageState();
}

class _AnimatedLogoPageState extends State<AnimatedLogoPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(
      animation: _animation,
    );
  }
}
