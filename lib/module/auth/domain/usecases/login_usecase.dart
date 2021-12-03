import 'package:dartz/dartz.dart';
import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/errors/errors.dart';
import 'package:test_digistarts/module/auth/domain/interfaces/auth_interface.dart';
import 'package:validators/validators.dart';

abstract class ILoginUseCase {
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams params});
}

class LoginUseCase implements ILoginUseCase {
  final IAuthRepository? repository;

  LoginUseCase({this.repository});

  @override
  Future<Either<AuthException, LoggedUserModel>> login(
      {LoginParams? params}) async {
    if (isNull(params!.codigo ?? "")) {
      return Left(AuthException("Código do invalido"));
    }

    if (params.password?.isEmpty ?? true) {
      return Left(AuthException("Password invalida"));
    }

    return await repository!.login(params: params);
  }
}

class LoginParams {
  final String? codigo;
  final String? password;

  LoginParams({this.codigo, this.password});
}
