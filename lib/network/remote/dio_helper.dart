import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.12/api/",
      receiveDataWhenStatusError: true,
    ));
    // if (!kReleaseMode) {
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    //}
  }
  //https://diabetes-802s.onrender.com/
  //http://192.168.1.12/api/
  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'token': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.get(
        url,
        queryParameters: query
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = "en",
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': 'ar',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
