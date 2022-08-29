import 'package:e_commerce_app/features/auth/screens/auth_screen.dart';
import 'package:e_commerce_app/home/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    default:
      return (MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('ERROR 404'),
                ),
              )));
  }
}
