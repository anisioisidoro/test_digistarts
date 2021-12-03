// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$isLoginLoadingAtom = Atom(name: '_AuthStoreBase.isLoginLoading');

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  final _$isRegisterLoadingAtom =
      Atom(name: '_AuthStoreBase.isRegisterLoading');

  @override
  bool get isRegisterLoading {
    _$isRegisterLoadingAtom.reportRead();
    return super.isRegisterLoading;
  }

  @override
  set isRegisterLoading(bool value) {
    _$isRegisterLoadingAtom.reportWrite(value, super.isRegisterLoading, () {
      super.isRegisterLoading = value;
    });
  }

  final _$errorAtom = Atom(name: '_AuthStoreBase.error');

  @override
  AuthException? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(AuthException? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loggedUserAtom = Atom(name: '_AuthStoreBase.loggedUser');

  @override
  LoggedUserModel? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(LoggedUserModel? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams? params}) {
    return _$loginAsyncAction.run(() => super.login(params: params));
  }

  @override
  String toString() {
    return '''
isLoginLoading: ${isLoginLoading},
isRegisterLoading: ${isRegisterLoading},
error: ${error},
loggedUser: ${loggedUser}
    ''';
  }
}
