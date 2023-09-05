// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_app/presentation/screens/auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/auth/login_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => LoginProvider(context),
              child: LoginScreen()),
        );

      case SignUpScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());

      default:
        return null;
    }
  }
}
