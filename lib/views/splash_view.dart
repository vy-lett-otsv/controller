import 'package:flutter/material.dart';

import '../viewmodels/splash_view_model.dart';

class SplashView extends StatefulWidget {

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  late SplashViewModel _splashViewModel;

  void _initViewModel(BuildContext context) {
    _splashViewModel = SplashViewModel()..onInitView(context);
  }

  @override
  void initState() {
    super.initState();
    _initViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}