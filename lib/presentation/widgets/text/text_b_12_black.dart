import 'package:flutter/material.dart';

class TextB12Black extends StatefulWidget {
  final String text;
  double paddingTop;
  double paddingBottom;
  double paddingLeft;
  double paddingRight;
  Color color;
  TextAlign align;

  TextB12Black(
      {super.key,
      required this.text,
      this.paddingTop = 0.0,
      this.paddingBottom = 0.0,
      this.paddingLeft = 0.0,
      this.paddingRight = 0.0,
      this.color = Colors.black,
      this.align = TextAlign.left});

  @override
  State<TextB12Black> createState() => _TextB12BlackState();
}

class _TextB12BlackState extends State<TextB12Black> {
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
          fontSize: 12,
          fontFamily: 'Sen-Regular',
        ),
      ),
    );
  }
}

// styleName: Body - bold;
// font-family: Sen;
// font-size: 14px;
// font-weight: 700;
// line-height: 17px;
// letter-spacing: 0em;
// text-align: left;
