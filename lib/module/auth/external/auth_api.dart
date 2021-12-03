import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';
import 'package:test_digistarts/module/auth/infra/datasources/auth_datasource.dart';

class AuthApi implements IAuthDatasource {

  InterceptedHttp http;

  AuthApi(this.http);

  @override
  Future<LoggedUserModel> login({ LoginParams? params}) async {

      var response = await http.post(Uri.parse("https://universitybackend.herokuapp.com/estudante/login"),
          body: json.encode({"codigo": params?.codigo, "password": params?.password}),
           );

      return LoggedUserModel.fromJson(json.decode(response.body));
  }

 


}
