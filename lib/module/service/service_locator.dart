import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';
import 'package:test_digistarts/module/auth/external/auth_api.dart';
import 'package:test_digistarts/module/auth/infra/repositories/auth_repository.dart';
import 'package:test_digistarts/module/covid/domain/usecases/get_covid_stats_usecase.dart';
import 'package:test_digistarts/module/covid/external/covid_api.dart';
import 'package:test_digistarts/module/covid/infra/repositories/covid_repository.dart';
import 'package:test_digistarts/module/interceptors/global_interceptor.dart';
import 'package:test_digistarts/module/interceptors/logger_interceptor.dart';
import 'package:test_digistarts/store/auth_store/auth_store.dart';
import 'package:test_digistarts/store/covid_store/covid_store.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(CovidStore(
      repository: CovidUseCase(
          repository: CovidRepository(
              covidDatasource: CovidApi(InterceptedHttp.build(
                  interceptors: [GlobalInterceptor()]))))));

  locator.registerSingleton(AuthStore(
      loginRepository: LoginUseCase(
          repository: AuthRepository(
              authDatasource: AuthApi(InterceptedHttp.build(
                  interceptors: [LoggerInterceptor()]))))));
}
