import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/domain/errors/errors.dart';
import 'package:test_digistarts/module/covid/domain/usecases/get_covid_stats_usecase.dart';
part 'covid_store.g.dart';

class CovidStore = _CovidStoreBase with _$CovidStore;

abstract class _CovidStoreBase with Store {
  final ICovidUseCase repository;

  _CovidStoreBase({required this.repository});

  @observable
  bool isloadingState = false;

  @observable
  bool isloadingCase = false;

  @observable
  CaseEntity? caseEntity;

  ObservableList<String> states = ObservableList.of({});

  ObservableList<Result> cases = ObservableList.of({});

  @action
  Future<Either<CovidException, CaseEntity>> get() async {
    try {
      isloadingState = true;

      var result = await repository.get();

      //get the data coming from the api, the l is to get the data on the left side, in this case the errors
      //the r is to get the data on the right side, when the request was successful
      return result.fold((l) => Left(l), (r) {
        if (r.results?.length != null && r.results?.length != 0) {
          filterState(results: r.results as List<Result>);
        }
        return Right(caseEntity = r);
      });
    } catch (e) {
      return Left(CovidException(e.toString()));
    } finally {
      isloadingState = false;
    }
  }

  filterState({required List<Result> results}) {
    try {
      states.clear();
      results.forEach((element) {
        if (!states.contains(element.state)) {
          states.add(element.state);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  searchCases({required String state}) {
    try {
      isloadingCase = true;

      var result = caseEntity?.results
          ?.where((element) => element.state == state)
          .toList();

          cases.addAll(result as List<Result>);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloadingCase = false;
    }
  }
}
