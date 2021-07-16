import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Widget child;
  final bool isLarge;

  AppPrimaryButton({
    @required this.onPressed,
    this.child,
    this.label = "",
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Color(0xFF30B309);
    return SizedBox(
      width: isLarge ? 300 : 150,
      height: 60,
      child: FlatButton(
        color: _primaryColor,
        onPressed: onPressed,
        child: child != null
            ? child
            : Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
