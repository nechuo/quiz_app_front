import 'package:flutter/material.dart';

class FadeTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? color;

  const FadeTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black,
  });

  @override
  State<FadeTextWidget> createState() => FadeTextState();
}

class FadeTextState extends State<FadeTextWidget> {
  double opacity = 0.0;

  void _updateOpacity() {
    setState(() {
      opacity = 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), _updateOpacity);
  }

  @override
  Widget build(context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 500),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: widget.fontSize, color: widget.color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
