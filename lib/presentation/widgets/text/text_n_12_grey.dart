import 'package:flutter/material.dart';

class TextN12grey extends StatefulWidget {
  final String text;
  double paddingTop;
  double paddingBottom;
  double paddingLeft;
  double paddingRight;
  Color color;
  TextAlign align;
  FontWeight weight;

  TextN12grey({
    super.key,
    required this.text,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.color = Colors.grey,
    this.align = TextAlign.left,
    this.weight = FontWeight.w400,
  });

  @override
  State<TextN12grey> createState() => _TextN12greyState();
}

class _TextN12greyState extends State<TextN12grey> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop,
        bottom: widget.paddingBottom,
        left: widget.paddingLeft,
        right: widget.paddingRight,
      ),
      child: Text(
        widget.text,
        textAlign: widget.align,
        style: TextStyle(
          fontWeight: widget.weight,
          fontSize: 12,
          fontFamily: 'Sen-Regular',
          color: widget.color,
        ),
      ),
    );
  }
}

// styleName: Caption - regular;
// font-family: Sen;
// font-size: 12px;
// font-weight: 400;
// line-height: 14px;
// letter-spacing: 0em;
// text-align: left;
