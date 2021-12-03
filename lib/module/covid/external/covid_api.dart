import 'package:dio/dio.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/infra/datasources/covid_datasource.dart';
import 'package:test_digistarts/utils/global_const.dart';

class CovidApi implements ICovidDatasource {
  Dio dio;

  CovidApi(this.dio);

  @override
  Future<CaseEntity> get() async {
    var response = await dio.get(
      API_URL +
          "dataset/covid19/caso/data/?search=&date=&state=&place_type=state&is_last=&city_ibge_code",
    );

    return CaseEntity.fromJson(response.data);
  }
}
