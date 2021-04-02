import 'package:finboard_app/repositories/company_repository.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/services/finnhub_rest_service/finnhub_rest_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio(), instanceName: 'FinnHubDio');
  serviceLocator.registerLazySingleton<FinHubApi>(() => FinHubApi(serviceLocator<Dio>(instanceName: 'FinnHubDio')));
  serviceLocator.registerLazySingleton<FinnhubRestService>(() => FinnhubRestService(serviceLocator<Dio>(instanceName: 'FinnHubDio'), serviceLocator<FinHubApi>()));
  serviceLocator..registerFactory<CompanyRepository>(() => CompanyRepository(serviceLocator<FinnhubRestService>()));
}