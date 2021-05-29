import 'package:finboard_app/repositories/contracts/chart_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/market_cap_repository_contract.dart';
import 'package:finboard_app/repositories/impl/chart_repository.dart';
import 'package:finboard_app/repositories/impl/company_repository.dart';
import 'package:finboard_app/repositories/impl/market_cap_repository.dart';
import 'package:finboard_app/services/api/back_api.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/services/datasource/back_rest_service.dart';
import 'package:finboard_app/services/datasource/finnhub_rest_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final serviceLocator = GetIt.instance;

void setup() {
  //Finnhub
  serviceLocator.registerLazySingleton<Dio>(() => Dio(),
      instanceName: 'FinnHubDio');
  serviceLocator.registerLazySingleton<FinHubApi>(
      () => FinHubApi(serviceLocator<Dio>(instanceName: 'FinnHubDio')));
  serviceLocator.registerLazySingleton<FinnhubRestService>(() =>
      FinnhubRestService(serviceLocator<Dio>(instanceName: 'FinnHubDio'),
          serviceLocator<FinHubApi>()));

  // Back Api
  serviceLocator.registerLazySingleton<Dio>(() => Dio(),
      instanceName: 'BackApiDio');
  serviceLocator.registerLazySingleton<BackApi>(
      () => BackApi(serviceLocator<Dio>(instanceName: 'BackApiDio')));
  serviceLocator.registerLazySingleton<BackRestService>(() => BackRestService(
      serviceLocator<Dio>(instanceName: 'BackApiDio'),
      serviceLocator<BackApi>()));

  // Repositories
  serviceLocator
    ..registerFactory<CompanyRepositoryContract>(
        () => CompanyRepository(serviceLocator<FinnhubRestService>()));
  serviceLocator
    ..registerFactory<ChartRepositoryContract>(
        () => ChartRepository(serviceLocator<FinnhubRestService>()));
  serviceLocator
    ..registerFactory<MarketCapRepositoryContract>(
        () => MarketCapRepository(serviceLocator<BackRestService>()));
}
