import 'package:dio/dio.dart';
import '../data/auth_entity.dart';

class AuthAPIService{
  static const PATH_LOGIN = "/auth/login";
  static const REFRESH_TOKEN = "/auth/refresh_token";

  final String kBaseURL = "http://103.90.234.225:3002";

  final Dio dio = Dio();

  AuthAPIService._();

  static AuthAPIService? _instance;

  static AuthAPIService getInstance() {
    _instance ??= AuthAPIService._();
    return _instance!;
  }

  Future<dynamic> get({required String url}) async {
    try {
      final response = await dio.get(kBaseURL + url);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<dynamic> post({required String url, dynamic data}) async {
    try {
      final response = await dio.post(kBaseURL + url, data: data);

      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<AuthEntity> login(String username, String password) async {
    Map<String, String> data = {
      "username": username,
      "password": password,
    };

    final response = await post(url: PATH_LOGIN, data: data);
    return AuthEntity.fromJson(response);
  }


  Future<AuthEntity> refreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    Map<String, String> data = {
      "refreshToken": refreshToken,
      "accessToken": accessToken
    };
    final response = await post(url: REFRESH_TOKEN, data: data);
    return AuthEntity.fromJson(response);
  }
}
