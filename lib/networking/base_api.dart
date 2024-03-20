import 'dart:io';

import 'package:dio/dio.dart';
import 'method.dart';

abstract class BaseApiProvider {
  final _dio = Dio();
  Dio get dio => _dio;
  BaseApiProvider(BaseOptions options) {
    _dio.options = options;
  }

  void _addInterceptors() {
    _dio.interceptors.clear();
    addMoreInterceptor(_dio);
    // _dio.interceptors.add(PrettyDioLogger(
    //     requestBody: true,
    //     responseBody: true,
    //     requestHeader: true,
    //     responseHeader: true,
    //     maxWidth: 200,
    //     logPrint: (logValue) {
    //       log(logValue.toString());
    //     }));
  }

  void addMoreInterceptor(Dio dio);

  Future<dynamic> request({
    String? rawData,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    FormData? formParams,
    required String method,
    required String url,
  }) async {
    final dynamic responseJson;
    try {
      _addInterceptors();
      final response = await _dio.request(url,
          queryParameters: queryParams,
          data: (formParams != null)
              ? formParams
              : (data != null)
                  ? data
                  : rawData,
          options: Options(
              method: method,
              validateStatus: (code) {
                return code! >= 200 && code < 300;
              }));
      responseJson = formatRes(response.statusCode, response.data);
    } on SocketException {
      throw ErrorException(HttpCode.noNetwork, "");
    } on DioError catch (e) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (e.response?.statusCode == HttpCode.unauthorized) {}
      if (e.error is SocketException) {
        throw ErrorException(HttpCode.noNetwork, "");
      }
      throw ErrorException(e.response?.statusCode, e.message);
    }
    return responseJson;
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return await request(method: Method.get, url: url, queryParams: params);
  }

  Future<dynamic> postMultiPart(String url, FormData formData) async {
    return await request(method: Method.post, url: url, formParams: formData);
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? params}) async {
    return await request(method: Method.post, url: url, data: params);
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? params}) async {
    return await request(method: Method.put, url: url, data: params);
  }

  Future<dynamic> patch(String url, {Map<String, dynamic>? params}) async {
    return await request(method: 'patch', url: url, data: params);
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? params}) async {
    return await request(method: 'delete', url: url, data: params);
  }

  dynamic formatRes(int? code, dynamic data) {
    switch (code) {
      case HttpCode.success:
        return data;
      case HttpCode.badRequest:
        throw BadRequestException('response.body.toString()');
      case HttpCode.unauthorized:
      case HttpCode.forbidden:
        throw UnauthorisedException('response.body.toString()');
      case HttpCode.internalServerError:
      default:
        throw ErrorException(code,
            'Error occured while Communication with Server with StatusCode : $code');
    }
  }
}

class HttpCode {
  static const int success = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int noNetwork = 702;
}

class CustomException implements Exception {
  final String? message;
  final int? code;

  CustomException([this.code, this.message]);

  @override
  String toString() {
    return "$code: $message";
  }
}

class ErrorException extends CustomException {
  ErrorException([int? code, String? message]) : super(code, message);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(400, "Invalid Request: $message");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(401, "Unauthorised: $message");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: $message");
}
