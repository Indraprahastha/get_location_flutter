import 'package:flutter/material.dart';

class TextB16Black extends StatefulWidget {
  final String text;
  double paddingTop;
  double paddingBottom;
  double paddingLeft;
  double paddingRight;
  TextAlign align;
  Color color;

  TextB16Black({
    super.key,
    required this.text,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.align = TextAlign.start,
    this.color = Colors.black,
  });

  @override
  State<TextB16Black> createState() => _TextB16BlackState();
}

class _TextB16BlackState extends State<TextB16Black> {
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
          color: widget.color,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          fontFamily: 'Sen-Regular',
        ),
      ),
    );
  }
}

// styleName: Body large - bold;
// font-family: Sen;
// font-size: 16px;
// font-weight: 700;
// line-height: 19px;
// letter-spacing: 0em;
// text-align: left;