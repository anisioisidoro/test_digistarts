import 'package:dartz/dartz.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/domain/errors/errors.dart';
import 'package:test_digistarts/module/covid/domain/interfaces/covid_interface.dart';
import 'package:test_digistarts/module/covid/infra/datasources/covid_datasource.dart';


class CovidRepository implements ICovidRepository {
  final ICovidDatasource? covidDatasource;

  CovidRepository({this.covidDatasource});
  @override
  Future<Either<CovidException, CaseEntity>> get() async {
    try {
      final cases = await covidDatasource?.get();

      return Right(cases!);
    } on CovidException catch (e) {
      return Left(e);
    } on Exception {
      return Left(CovidException("Erro, verifique a conexão de internet"));
    }
  }
}
