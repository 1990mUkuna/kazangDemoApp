import 'package:flutter/material.dart';

class AppUnderlineButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool isDark;
  final double fontSize;
  final FontWeight fontWeight;

  AppUnderlineButton({
    @required this.onPressed,
    @required this.label,
    this.isDark = false,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: fontWeight,
          decoration: TextDecoration.underline,
          decorationThickness: 1,
          fontSize: fontSize,
          color: isDark ? Colors.black : Colors.black,
        ),
      ),
    );
  }
}
