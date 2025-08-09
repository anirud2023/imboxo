import 'package:flutter/material.dart';

class ImboxoLogo extends StatelessWidget {
  final double fontSize;
  final double borderWidth;
  final Color textColor;
  final Color borderColor;
  final double letterSpacing;

  const ImboxoLogo({
    super.key,
    this.fontSize = 55,
    this.borderWidth = 2,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.letterSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 'IMBOXO'.split('').map((char) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: letterSpacing / 2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Text(
                char,
                textAlign: TextAlign.center,
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  height: 1.0,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
