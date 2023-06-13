import 'package:dio/dio.dart';

abstract class BaseService {
  final String kBaseURL = "http://103.90.234.225:3002";

  final Dio dio = Dio();
  Future<dynamic> get({required String url});
  Future<dynamic> post({required String url, dynamic data});
}
