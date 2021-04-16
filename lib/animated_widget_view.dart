import 'package:flutter/material.dart';

class AnimatedWidgetView extends StatefulWidget {
  AnimatedWidgetView({Key key}) : super(key: key);

  @override
  _AnimatedWidgetViewState createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation growAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
        // print('GrowAnimation value: ${growAnimation.value}');
      });
    growAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: growAnimation.value,
          width: growAnimation.value,
          color: Colors.red,
        ),
      ),
    );
  }
}
