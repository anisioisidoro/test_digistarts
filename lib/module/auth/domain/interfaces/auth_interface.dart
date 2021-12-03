
import 'package:dartz/dartz.dart';
import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/errors/errors.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';




abstract class IAuthRepository{
  Future<Either<AuthException,LoggedUserModel>> login({LoginParams params});
}