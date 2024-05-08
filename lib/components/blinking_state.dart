import 'dart:async';

import 'package:flutter/material.dart';
class BlinkingState extends StatefulWidget {
  const BlinkingState({super.key});

  @override
  State<BlinkingState> createState() => _BlinkingStateState();
}

class _BlinkingStateState extends State<BlinkingState> {
  bool _isVisible=true;
  @override
  void initState(){
    super.initState();
    _startBlinking();
  }
  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void _startBlinking() {
    // Toggle visibility every 500 milliseconds
    // Adjust duration to change blinking speed
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      _toggleVisibility();
    });
  }
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Icon(
          Icons.star,
          size: 50.0,
          color: Colors.yellow,
        ),
    );

  }
}
