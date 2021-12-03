import 'dart:convert';

import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';
import 'package:test_digistarts/module/covid/infra/datasources/covid_datasource.dart';
import 'package:test_digistarts/utils/global_const.dart';

class CovidApi implements ICovidDatasource {
  
  InterceptedHttp http;

  CovidApi(this.http);

  @override
  Future<CaseEntity> get() async {

  
   
    var response = await http.get(
     Uri.parse( API_URL + "dataset/covid19/caso/data/?search=&date=&state=&place_type=state&is_last=&city_ibge_code"),
    );

    return CaseEntity.fromJson(json.decode(response.body));
  }
}
