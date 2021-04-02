import 'package:dio/dio.dart';

import '../../utils/constants.dart';

class BasicRestService {

  Dio dio;

  BasicRestService(Dio dio) {
    this.dio = dio;
    this.dio
        ..options.connectTimeout = Constants.restConnectionTimeout
        ..options.sendTimeout = Constants.restSendTimeout
        ..interceptors.add(InterceptorsWrapper(onError: _catch))
        ..interceptors.add(LogInterceptor(requestBody: true));

    _configureHeader();
  }

  void disconnect() {
    this.dio.clear();
  }

  void _configureHeader() {
    // this.dio.options.headers['X-Finnhub-Token'] = Constants.apiKey;
  }

  void _catch(Exception exception) {
    print("[LOG] Error request: $exception");
  }

}