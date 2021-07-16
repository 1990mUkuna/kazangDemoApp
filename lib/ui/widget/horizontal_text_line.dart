import 'package:flutter/material.dart';

class HorizontalTextLine extends StatelessWidget {
  const HorizontalTextLine(
      {this.label, this.height, this.thickness, this.fontSize});

  final String label;
  final double height;
  final double thickness;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: height,
              thickness: thickness,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            //color: isDark ? Colors.black : Colors.white,
          ),
        ),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              thickness: thickness,
              color: Colors.black,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
