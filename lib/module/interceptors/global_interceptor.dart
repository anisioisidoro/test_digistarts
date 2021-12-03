import 'package:dio/dio.dart';

class GlobalInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        "Token 8b34c604f8c467c5950550f6870bde20dc5229fb";
    options.headers['ContentTypeHeader'] = "application/json";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
