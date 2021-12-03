import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';
import 'package:test_digistarts/module/auth/infra/datasources/auth_datasource.dart';

class AuthApi implements IAuthDatasource {
  Dio dio;

  AuthApi(this.dio);

  @override
  Future<LoggedUserModel> login({LoginParams? params}) async {
    var response = await dio.post(
      "https://universitybackend.herokuapp.com/estudante/login",
      data: {"codigo": params?.codigo, "password": params?.password},
    );

    return LoggedUserModel.fromJson(response.data);
  }
}
