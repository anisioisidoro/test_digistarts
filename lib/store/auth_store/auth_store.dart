import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:test_digistarts/module/auth/domain/entities/logged_user.dart';
import 'package:test_digistarts/module/auth/domain/errors/errors.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';
import 'package:test_digistarts/pages/home_page/home_page.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final ILoginUseCase? loginRepository;

  late String myToken = "";
  late String meyId = "";
  late String name = "";

  _AuthStoreBase({
    this.loginRepository,
  });
  @observable
  bool isLoginLoading = false;

  @observable
  bool isRegisterLoading = false;

  @observable
  AuthException? error;

  @observable
  LoggedUserModel? loggedUser;

  @action
  Future<Either<AuthException, LoggedUserModel>> login(
      {LoginParams? params}) async {
    try {
      isLoginLoading = true;
      var result = await loginRepository!.login(params: params!);

      //get the data coming from the api, the l is to get the data on the left side, in this case the errors
      //the r is to get the data on the right side, when the request was successful

      return result.fold((l) {
        error = l;
        return Left(error!);
      }, (r) {
        if (r.sucess) {
          error = null;
          return Right(loggedUser = r);
        }
        error = AuthException(r.message!);
        return Left(error!);
      });
    } finally {
      isLoginLoading = false;
    }
  }

  loginResult(
      Either<AuthException, LoggedUserModel> value, BuildContext context) {
    if (value is Right) {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => HomePage(),
            transitionsBuilder: (context, animation, animation2, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: Duration(seconds: 1),
          ),
          (Route<dynamic> route) => false);
    } else {
      value.fold((l) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(l.message)));
      }, (r) => null);
    }
  }
}
