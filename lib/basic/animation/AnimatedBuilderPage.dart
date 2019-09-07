import 'package:flutter/material.dart';

/// AnimatedBuilder 将动画和Widget分离

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      /// AnimatedBuilder 需要布局约束才能显示
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          width: animation.value,
          height: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: LogoWidget(),
      animation: animation,
    );
  }
}
