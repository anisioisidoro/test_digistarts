import 'package:dartz/dartz.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/domain/errors/errors.dart';
import 'package:test_digistarts/module/covid/domain/interfaces/covid_interface.dart';

abstract  class ICovidUseCase{
  
  Future<Either<CovidException, CaseEntity>> get();
}

class CovidUseCase  implements ICovidUseCase{
  final ICovidRepository? repository;

  CovidUseCase({this.repository});

  @override
  Future<Either<CovidException, CaseEntity>> get() async {
    
    return await repository!.get();
  }
}
