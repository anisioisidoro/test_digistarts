// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CovidStore on _CovidStoreBase, Store {
  final _$isloadingStateAtom = Atom(name: '_CovidStoreBase.isloadingState');

  @override
  bool get isloadingState {
    _$isloadingStateAtom.reportRead();
    return super.isloadingState;
  }

  @override
  set isloadingState(bool value) {
    _$isloadingStateAtom.reportWrite(value, super.isloadingState, () {
      super.isloadingState = value;
    });
  }

  final _$isloadingCaseAtom = Atom(name: '_CovidStoreBase.isloadingCase');

  @override
  bool get isloadingCase {
    _$isloadingCaseAtom.reportRead();
    return super.isloadingCase;
  }

  @override
  set isloadingCase(bool value) {
    _$isloadingCaseAtom.reportWrite(value, super.isloadingCase, () {
      super.isloadingCase = value;
    });
  }

  final _$caseEntityAtom = Atom(name: '_CovidStoreBase.caseEntity');

  @override
  CaseEntity? get caseEntity {
    _$caseEntityAtom.reportRead();
    return super.caseEntity;
  }

  @override
  set caseEntity(CaseEntity? value) {
    _$caseEntityAtom.reportWrite(value, super.caseEntity, () {
      super.caseEntity = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_CovidStoreBase.get');

  @override
  Future<Either<CovidException, CaseEntity>> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
isloadingState: ${isloadingState},
isloadingCase: ${isloadingCase},
caseEntity: ${caseEntity}
    ''';
  }
}
