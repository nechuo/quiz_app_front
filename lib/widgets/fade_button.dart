import 'package:flutter/material.dart';

class FadeButtonWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final void Function() callback;

  const FadeButtonWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.callback,
  });

  @override
  State<FadeButtonWidget> createState() => FadeButtonWidgetState();
}

class FadeButtonWidgetState extends State<FadeButtonWidget> {
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        onPressed: widget.callback,
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: widget.fontSize, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
