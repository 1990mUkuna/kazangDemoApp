import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final List<String> autofillHint;
  final TextInputType textInputType;
  final bool isMultiline;
  final List<TextInputFormatter> inputFormatters;
  final IconData icon;
  final Function onTap;
  final bool isReadOnly;

  AppTextField({
    @required this.controller,
    @required this.hintText,
    this.labelText,
    this.autofillHint,
    this.textInputType = TextInputType.text,
    this.isMultiline = false,
    this.inputFormatters,
    this.icon,
    this.onTap,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    final Color _primaryColor = Color(0xFF30B309);
    return Material(
      child: TextFormField(
        onTap: onTap,
        autofillHints: autofillHint,
        style: theme.bodyText1.copyWith(fontSize: 16),
        controller: controller,
        cursorColor: _primaryColor,
        keyboardType: TextInputType.emailAddress,
        maxLines: isMultiline ? 8 : 1,
        validator: (value) {
          if (value.isEmpty) {
            return "Field cannot be left empty";
          }
          return null;
        },
        readOnly: isReadOnly,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: _primaryColor, size: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 10.0,
          ),
          // hintText: hintText,
          hintStyle: theme.bodyText1.copyWith(
            fontSize: 16,
            color: Color(0xFF2B2B2B),
          ),
          border: InputBorder.none,
          labelText: hintText,
          labelStyle: theme.bodyText1.copyWith(
            fontSize: 16,
            color: _primaryColor,
          ),
          filled: true,
          fillColor: Color(0xFFf4f4f4),
        ),
      ),
    );
  }
}
