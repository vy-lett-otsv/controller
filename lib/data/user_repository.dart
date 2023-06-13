import 'package:https/data/user_entity.dart';
import '../services/user_api_service.dart';

/// User Model
class UserRepository {
  static UserRepository? _instance;

  UserRepository._();

  static UserRepository getInstance() {
    _instance ??= UserRepository._();
    return _instance!;
  }

  bool shouldRefresh = false;

  late UserEntity _profile;

  UserEntity get profile => _profile;

  Future<void> getProfile() async {
    shouldRefresh = false;
    try {
      _profile = await UserAPIService.getInstance().getProfile();
      print(_profile.toString());
      return;
    } catch (e) {
      print(e);
    }
  }
}