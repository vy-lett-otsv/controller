import 'package:flutter/cupertino.dart';
import '../data/auth_entity.dart';
import '../data/user_repository.dart';
import '../models/sharedpref_model.dart';
import '../remote/auth_api_serrvice.dart';
import '../services/navigation_services.dart';
import 'base_view_model.dart';

class SignInViewModel extends BaseViewModel {

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void onClickLoginButton(BuildContext context) async {
    try {
      final AuthEntity entity = await AuthAPIService.getInstance().login(userController.text, passController.text);

      await Future.wait([
        SharedPrefModel.instance.setUserToken(userToken: entity.accessToken),
        SharedPrefModel.instance
            .setUserRefreshToken(userRefreshToken: entity.refreshToken),
      ]);

      await UserRepository.getInstance().getProfile();
      NavigationServices.instance.navigateToHomeScreen(context);
    } catch (e) {
     print(e);
    }
  }
}
