import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SequenceAnimationView extends StatefulWidget {
  @override
  _SequenceAnimationViewState createState() => _SequenceAnimationViewState();
}

class _SequenceAnimationViewState extends State<SequenceAnimationView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 200),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 300),
            tag: 'grow')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 400),
            tag: 'fade-in')
        .addAnimatable(
            animatable: Tween<double>(begin: 100, end: 0),
            from: Duration(milliseconds: 300),
            to: Duration(milliseconds: 800),
            tag: 'margin-slide')
        .animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Opacity(
            opacity: _sequenceAnimation['fade-in'].value,
            child: Container(
              margin: EdgeInsets.only(
                  left: _sequenceAnimation['margin-slide'].value),
              height: _sequenceAnimation['grow'].value,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
