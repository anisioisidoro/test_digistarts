

import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';


abstract class IAuthDatasource {
  Future<LoggedUserModel> login({LoginParams params});
}
