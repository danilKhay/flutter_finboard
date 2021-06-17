import 'package:finboard_app/entities/daily_market_cap.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/services/api/back_api.dart';
import 'package:finboard_app/services/datasource/basic_rest_service.dart';
import 'package:dio/dio.dart';

class BackRestService extends BasicRestService {
  BackApi _backApi;

  BackRestService(Dio dio, BackApi backApi) : super(dio) {
    _backApi = backApi;
  }

  //REST API Requests

  Future<DailyMarketCap> getDailyMarketCap(String symbol) async {
    return _handleFuture<DailyMarketCap>(
        _backApi.getDailyMarketCap(symbol: symbol));
  }

  Future<FairMarketCap> getFairMarketCap(String symbol) async {
    return _handleFuture<FairMarketCap>(
        _backApi.getFairMarketCap(symbol: symbol));
  }

  Future<FairMarketCapDiff> getFairMarketCapDiff(String symbol) async {
    return _handleFuture<FairMarketCapDiff>(
        _backApi.getFairMarketCapDiff(symbol: symbol));
  }

  Future<MarketCapDownLevel> getMarketCapDownLevel(String symbol) async {
    return _handleFuture<MarketCapDownLevel>(_backApi.getMarketCapDownLevel(
      symbol: symbol,
      percentile: '90',
    ));
  }

  //Handling
  Future<T> _handleFuture<T>(Future<T> future) {
    return future.then((value) => value).catchError((error) {
      //ToDo: Handle error
      _handleError(error);

      return Future<T>.error(error);
    });
  }

  void _handleError(dynamic error) {
    if (error is Exception) {
      //Handle future error
      print("[LOG] Future error: $error");
    }
  }
}
