import '../models/sharedpref_model.dart';
import '../remote/auth_api_serrvice.dart';

class AuthService {

  AuthService._();

  static AuthService? _instance;

  static AuthService get instance => AuthService();

  factory AuthService() {
    _instance ??= AuthService._();
    return _instance!;
  }

  static Future<bool> isUserLoggedIn() async {
    try {
      if (SharedPrefModel.instance.userToken == null ||
          SharedPrefModel.instance.userToken!.isEmpty) return false;

      /// get new token
      final response = await AuthAPIService.getInstance().refreshToken(
        accessToken: SharedPrefModel.instance.userToken!,
        refreshToken: SharedPrefModel.instance.userRefreshToken!,
      );
      print(SharedPrefModel.instance.userToken!);
      await SharedPrefModel.instance.setUserToken(userToken: response.accessToken);
      await SharedPrefModel.instance.setUserRefreshToken(userRefreshToken: response.refreshToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void logout() {
    SharedPrefModel.instance.deleteUserToken();
  }
}
