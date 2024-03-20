import 'package:dio/dio.dart';

import 'base_api.dart';

class ApiProvider extends BaseApiProvider {
  ApiProvider() : super(BaseOptions(baseUrl: 'https://ron.nal.vn'));

  @override
  void addMoreInterceptor(Dio dio) {}
}
