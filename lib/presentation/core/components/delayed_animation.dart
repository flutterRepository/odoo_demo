import 'dart:async';

import 'package:flutter/material.dart';

class DelayAnimation extends StatefulWidget {
  final int delay;
  final bool fromTop;
  final Widget child;
  const DelayAnimation({
    Key? key,
    required this.delay,
    this.fromTop = false,
    required this.child,
  }) : super(key: key);

  @override
  _DelayAnimationState createState() => _DelayAnimationState();
}

class _DelayAnimationState extends State<DelayAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controler;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controler = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.delay,
      ),
    );
    final curve = CurvedAnimation(
      parent: _controler,
      curve: Curves.decelerate,
    );
    _animOffset = Tween<Offset>(
      begin: Offset(0.0, widget.fromTop ? -0.5 : 0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controler.forward();
    });
  }

  @override
  dispose() {
    _controler.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controler,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
