import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/app/constants.dart';
import '../../app/extensions.dart';

const String accept = "Accept";
const String applicationJson = "application/json";
const String acceptLanguage = "Accept-Language";
const String language = "ar";
const String contentType = 'content-type';

class DioFactory {
  Dio getDio() {
    final Dio dio = Dio();
    Map<String, String> headers = {
      accept: applicationJson,
      contentType: applicationJson,
      acceptLanguage: language,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        sendTimeout: Constants.apiTimeOut,
        receiveTimeout: Constants.apiTimeOut,
        followRedirects: false,
        validateStatus: (status) {
          return status.orZero() < 500;
        });

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
      ));
    }

    return dio;
  }
}
