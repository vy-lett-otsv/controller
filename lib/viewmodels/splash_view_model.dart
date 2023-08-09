import 'package:flutter/material.dart';
import '../data/user_repository.dart';
import '../models/sharedpref_model.dart';
import '../services/auth_services.dart';
import '../services/navigation_services.dart';
import 'base_view_model.dart';

class SplashViewModel extends BaseViewModel {

  @override
  void onInitView(BuildContext context) {
    super.onInitView(context);
    _initialLaunchApp();
  }

  Future<void> _initialLaunchApp() async {
    await _initData();
    AuthService.isUserLoggedIn().then((isLoggedIn) async {
      if (isLoggedIn) {
        await _getUserData();
        _navigateToHomeScreen();
      } else {
        _navigateToSignInScreen();
      }
    });
  }

  Future<void> _getUserData() async {
    await UserRepository.getInstance().getProfile();
  }

  Future<void> _initData() async {
    print("Splash initData");
    await Future.wait([
      SharedPrefModel.instance.onInit(),
    ]);
  }

  void _navigateToHomeScreen() {
    NavigationServices.instance.navigateToHomeScreen(context);
  }

  void _navigateToSignInScreen() {
    NavigationServices.instance.navigateToSignInScreen(context);
  }
}