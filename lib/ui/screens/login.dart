import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/auth_bloc.dart';
import 'package:kazang_demo/blocs/auth_event.dart';
import 'package:kazang_demo/blocs/auth_state.dart';
import 'package:kazang_demo/ui/widget/app_primary_btn.dart';
import 'package:kazang_demo/ui/widget/app_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _navigateTosignUpIntro(BuildContext context) =>
      Navigator.of(context).pushNamed("/register");
  void _navigateToHome(BuildContext context) =>
      Navigator.of(context).pushNamed('/root-navigation');
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  _login(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      LoginUserEvent(
        username: _userNameController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme theme = Theme.of(context).textTheme;
    final Color _primaryColor = Color(0xFF30B309);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xFFE0F1DC),
              height: height,
              width: width,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          "Login",
                          style: theme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Dont have an Account',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            FlatButton(
                              onPressed: () => _navigateTosignUpIntro(context),
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "SignUp",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            icon: Icons.person,
                            controller: _userNameController,
                            hintText: "Username",
                            // labelText: S.of(context).email,
                          ),
                          SizedBox(height: 30),
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
                          SizedBox(height: 15),
                          SizedBox(height: 20),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthLoadFailure) {
                                return Text(
                                  "Invalid Credential",
                                  style: TextStyle(color: Colors.red),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                          AppPrimaryButton(
                              isLarge: true,
                              onPressed: () {
                                bool isValid = _formKey.currentState.validate();
                                if (isValid) {
                                  _login(
                                    context,
                                  );
                                }
                              },
                              child: BlocConsumer<AuthBloc, AuthState>(
                                builder:
                                    (BuildContext context, AuthState state) {
                                  if (state is AuthLoadInProgress) {
                                    return CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.black));
                                  } else {
                                    return Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    );
                                  }
                                },
                                listener: (BuildContext context, state) {
                                  if (state is AuthLoadSuccess) {
                                    return _navigateToHome(context);
                                  }
                                },
                              )),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
