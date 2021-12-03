import 'dart:io';
import 'package:http_interceptor/http_interceptor.dart';

class GlobalInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers[HttpHeaders.authorizationHeader] =
        "Token 8b34c604f8c467c5950550f6870bde20dc5229fb";
    data.headers[HttpHeaders.contentTypeHeader] = "application/json";

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
