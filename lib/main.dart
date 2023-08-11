import 'package:flutter/material.dart';
import 'package:https/services/navigation_services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Controller",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationServices.instance.routeBuilders,
    );
  }
}


