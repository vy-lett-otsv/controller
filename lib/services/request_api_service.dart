import 'package:dio/dio.dart';

import '../models/sharedpref_model.dart';


class RequestAPIService {
  final String kBaseURL = "http://103.90.234.225:3002";

  RequestAPIService._();

  static RequestAPIService? _instance;

  static RequestAPIService get instance {
    _instance ??= RequestAPIService._();
    return _instance!;
  }

  final Dio dio = Dio();

  Future<dynamic> get({required String url}) async {
    try {
      final String? userToken = SharedPrefModel.instance.userToken;
      Options options = Options();
      if (userToken != null && userToken.isNotEmpty) {
        options = Options(headers: {"Authorization": "Bearer $userToken"});
      }
      final response = await dio.get(kBaseURL + url, options: options);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic data,
    Options? requestOptions,
  }) async {
    try {
      final String? userToken = SharedPrefModel.instance.userToken;
      Options options = Options();
      if (requestOptions != null) {
        options = requestOptions;
      }
      if (userToken != null && userToken.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $userToken"};
      }
      final response =
          await dio.post(kBaseURL + url, data: data, options: options);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic data,
    Options? requestOptions,
  }) async {
    try {
      final String? userToken = SharedPrefModel.instance.userToken;
      Options options = Options();
      if (requestOptions != null) {
        options = requestOptions;
      }
      if (userToken != null && userToken.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $userToken"};
      }
      final response =
          await dio.put(kBaseURL + url, data: data, options: options);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }

  Future<dynamic> delete({
    required String url,
    Options? requestOptions,
  }) async {
    try {
      final String? userToken = SharedPrefModel.instance.userToken;
      Options options = Options();
      if (requestOptions != null) {
        options = requestOptions;
      }
      if (userToken != null && userToken.isNotEmpty) {
        options.headers = {"Authorization": "Bearer $userToken"};
      }
      final response = await dio.delete(kBaseURL + url, options: options);
      return response.data;
    } on DioError catch (dioError) {
      print(dioError);
    }
  }
}
