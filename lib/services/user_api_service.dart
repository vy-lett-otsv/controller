import 'package:dio/dio.dart';
import '../data/user_entity.dart';
import '../models/sharedpref_model.dart';
import 'base_api_service.dart';

class UserAPIService extends BaseService{
  static const kProfilePath = "/users/me";

  UserAPIService._();

  static UserAPIService? _instance;

  static UserAPIService getInstance() {
    _instance ??= UserAPIService._();
    return _instance!;
  }

  @override
  Future<dynamic> get({required String url}) async {
    try {
      final Options options = Options(
        headers: {
          "Authorization": "Bearer ${SharedPrefModel.instance.userToken}",
        },
      );
      final response = await dio.get(kBaseURL + url, options: options);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<UserEntity> getProfile() async {
    final response = await get(url: kProfilePath);
    return UserEntity.fromJson(response);
  }

  @override
  Future<dynamic> post({required String url, dynamic data}) async {
    try {
      final response = await dio.post(kBaseURL + url, data: data);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }
}
