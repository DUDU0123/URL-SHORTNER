import 'package:flutter/material.dart';

class TextWidgetCommon extends StatelessWidget {
  const TextWidgetCommon({
    super.key,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.softWrap,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    required this.text,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
  });

  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? softWrap;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final String text;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      text,
      style: TextStyle(
        color: textColor,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      ),
    );
  }
}