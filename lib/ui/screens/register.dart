import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazang_demo/blocs/auth_bloc.dart';
import 'package:kazang_demo/blocs/auth_event.dart';
import 'package:kazang_demo/ui/widget/app_primary_btn.dart';
import 'package:kazang_demo/ui/widget/app_text_field.dart';
import 'package:kazang_demo/ui/widget/horizontal_text_line.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void _registerUser(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterUserEvent(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }

  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  _navigateToLogin(BuildContext context) =>
      Navigator.of(context).pushNamed("/login");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme theme = Theme.of(context).textTheme;
    final Color _primaryColor = Color(0xFF30B309);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //backgroundColor: Color(0x44000000),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.chevron_left, size: 32.0),
              ),
            ),
          ],
        ),
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE0F1DC),
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Sign Up",
                        style: theme.headline4.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(
                        icon: Icons.person,
                        controller: _usernameController,
                        hintText: "Username",
                        // labelText: S.of(context).email,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        style: theme.bodyText1.copyWith(fontSize: 16),
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Is Empty";
                          }
                          return null;
                        },
                        cursorColor: _primaryColor,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              padding: const EdgeInsets.only(right: 16),
                              icon: Icon(
                                _showPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: _primaryColor,
                              ),
                              onPressed: _toggleShowPassword),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: 10.0,
                          ),
                          labelText: "Password",
                          labelStyle: theme.bodyText1.copyWith(
                            fontSize: 16,
                            color: _primaryColor,
                          ),
                          hintStyle: theme.bodyText1.copyWith(
                            fontSize: 16,
                            color: Color(0xFF2B2B2B),
                          ),
                          filled: true,
                          fillColor: Color(0xFFf4f4f4),
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        style: theme.bodyText1.copyWith(fontSize: 16),
                        controller: _confirmPasswordController,
                        obscureText: !_showPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is Empty";
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return "Password Not Matched";
                          }
                          return null;
                        },
                        cursorColor: _primaryColor,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              padding: const EdgeInsets.only(right: 16),
                              icon: Icon(
                                _showPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: _primaryColor,
                              ),
                              onPressed: _toggleShowPassword),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: _primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: 10.0,
                          ),
                          labelStyle: theme.bodyText1.copyWith(
                            fontSize: 16,
                            color: _primaryColor,
                          ),
                          labelText: "Conform Password",
                          hintStyle: theme.bodyText1.copyWith(
                            fontSize: 16,
                            color: Color(0xFF2B2B2B),
                          ),
                          filled: true,
                          fillColor: Color(0xFFf4f4f4),
                        ),
                      ),
                      SizedBox(height: 30),
                      AppPrimaryButton(
                          isLarge: true,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/root-navigation');
                            bool isValid = _formKey.currentState.validate();
                            if (isValid) {}
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Accept Terms and conditions",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
