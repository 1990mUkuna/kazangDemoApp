import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/auth_bloc.dart';
import 'package:kazang_demo/repositories/auth_repository.dart';
import 'package:kazang_demo/repositories/product_repository.dart';
import 'package:kazang_demo/root_navigator.dart';
import 'package:kazang_demo/services/auth_service.dart';
import 'package:kazang_demo/ui/screens/login.dart';
import 'package:kazang_demo/ui/screens/register.dart';

import 'blocs/bloc_observer.dart';
import 'blocs/products_bloc.dart';
import 'services/product_service.dart';
import 'ui/screens/home.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  final AuthRepository authRepository = AuthRepository(
    authService: AuthService(),
  );
  final ProductRepository productRepository = ProductRepository(
    productService: ProductService(),
  );
  runApp(App(
    authRepository: authRepository,
    productRepository: productRepository,
  ));
}

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final ProductRepository productRepository;
  App({
    @required this.authRepository,
    @required this.productRepository,
  });

  final Color _primaryColor = Color(0xFF74EE4F);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepository: authRepository)),
        BlocProvider<ProductsBloc>(
            create: (context) =>
                ProductsBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KazangDemo',
        theme: ThemeData(
          fontFamily: "Gilroy",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedLabelStyle: TextStyle(color: Colors.black),
            selectedIconTheme: IconThemeData(size: 18),
            unselectedIconTheme: IconThemeData(size: 18),
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: _primaryColor,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(fontFamily: "Gilroy-Medium"),
          ),
          cursorColor: _primaryColor,
        ),
        routes: {
          '/': (cotext) => Login(),
          "/register": (context) => Register(),
          '/root-navigation': (context) => RoootBottomNavigation(),
          '/main': (context) => Home(),
        },
      ),
    );
  }
}
