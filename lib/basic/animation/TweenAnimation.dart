import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  AnimationStatus _animationStatus;
  double _animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {
          _animationValue = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          _animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _controller.reset();
                  _controller.forward();
                },
                child: Text('start'),
              ),
              Text("status" + _animationStatus.toString(),
                  textDirection: TextDirection.ltr),
              Text("value" + _animationValue.toString(),
                  textDirection: TextDirection.ltr),
              Container(
                width: _animation.value,
                height: _animation.value,
                child: FlutterLogo(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
