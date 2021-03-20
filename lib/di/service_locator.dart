import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../utils/constants.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<FinHubApi>(() => FinHubApi(serviceLocator()));
}