
import 'package:test_digistarts/module/covid/domain/entities/case_entity.dart';

abstract class ICovidDatasource {
  Future<CaseEntity> get();
}
