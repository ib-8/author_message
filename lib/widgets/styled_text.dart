import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    Key? key,
    this.size = 18,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.textHeight = 1,
    this.align = TextAlign.start,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final double textHeight;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: textHeight,
      ),
    );
  }
}
