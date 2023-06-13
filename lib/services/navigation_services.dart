import 'package:flutter/material.dart';
import 'package:https/views/home_view.dart';
import 'package:https/views/sign_in_view.dart';
import '../views/splash_view.dart';
class NavigationServices {
  static NavigationServices _instance = const NavigationServices._internal();
  static NavigationServices get instance => _instance;
  const NavigationServices._internal();

  factory NavigationServices() {
    if(instance == null) {
      _instance = const NavigationServices._internal();
    }
    return _instance;
  }

  static const String SPLASH_PROGRESS_ROUTE = "/SPLASH_PROGRESS_ROUTE";
  static const String HOME_ROUTE = "/HOME_ROUTE";
  static const String SIGN_IN_ROUTE = "/SIGN_IN_ROUTE";

  String initialRoute() => SPLASH_PROGRESS_ROUTE;

  Route<dynamic> routeBuilders(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_PROGRESS_ROUTE:
        return MaterialPageRoute(builder: (_) => SplashView());
      case SIGN_IN_ROUTE:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (route) => false);
  }

  void navigateToSignInScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, SIGN_IN_ROUTE, (route) => false);
  }
}
