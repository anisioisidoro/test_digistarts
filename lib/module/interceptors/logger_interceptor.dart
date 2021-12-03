import 'dart:io';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';


class LoggerInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers[HttpHeaders.contentTypeHeader] = "application/json";
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {

    return data;
  }
}
