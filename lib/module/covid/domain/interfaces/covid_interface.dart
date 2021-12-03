import 'package:dartz/dartz.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/domain/errors/errors.dart';

abstract class ICovidRepository {
  Future<Either<CovidException, CaseEntity>> get();
}
