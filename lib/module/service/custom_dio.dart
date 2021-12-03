import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:test_digistarts/module/interceptors/global_interceptor.dart';
import 'package:test_digistarts/module/interceptors/logger_interceptor.dart';

class customDio extends DioForNative {
  customDio([BaseOptions? options]) : super(options) {
    interceptors.add(GlobalInterceptor());
    interceptors.add(LoggerInterceptor());
  }
}
