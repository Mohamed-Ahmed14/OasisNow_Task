import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final Color? color;
  const CustomText({
    this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.color,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontFamily:'Satoshi',
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
      ),
    textAlign: TextAlign.center,);
  }
}
