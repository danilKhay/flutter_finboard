import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/services/basic/basic_rest_service.dart';
import 'package:dio/dio.dart';

import '../../entities/entities.dart';
import '../../utils/constants.dart';

class FinnhubRestService extends BasicRestService {
  FinHubApi _finHubApi;

  FinnhubRestService(Dio dio, FinHubApi finHubApi) : super(dio) {
    _finHubApi = finHubApi;
  }

  //REST API Requests

  Future<SearchSymbolsResult> searchSymbols(String searchQuery) async {
    return _handleFuture<SearchSymbolsResult>(_finHubApi.searchSymbolsByName(
        token: Constants.apiKey, searchQuery: searchQuery));
  }

  Future<List<Stock>> getStocks(String exchange) async {
    return _handleFuture<List<Stock>>(
        _finHubApi.getStocks(token: Constants.apiKey, exchange: exchange));
  }

  Future<CompanyProfile> getCompanyProfile(String symbol) async {
    return _handleFuture<CompanyProfile>(
        _finHubApi.getCompanyProfile(token: Constants.apiKey, symbol: symbol));
  }

  Future<List<CompanyNews>> getCompanyNews(
      String symbol, String fromDate, String toDate) async {
    return _handleFuture<List<CompanyNews>>(_finHubApi.getCompanyNews(
        token: Constants.apiKey,
        symbol: symbol,
        fromDate: fromDate,
        toDate: toDate));
  }

  Future<CompanyNewsSentiment> getCompanyNewsSentiment(String symbol) async {
    return _handleFuture<CompanyNewsSentiment>(_finHubApi
        .getCompanyNewsSentiment(token: Constants.apiKey, symbol: symbol));
  }

  Future<List<String>> getPeers(String symbol) async {
    return _handleFuture<List<String>>(
        _finHubApi.getPeers(token: Constants.apiKey, symbol: symbol));
  }

  Future<BasicFinancials> getBasicFinancials(String symbol,
      {String metric = 'all'}) async {
    return _handleFuture<BasicFinancials>(_finHubApi.getBasicFinancials(
        token: Constants.apiKey, symbol: symbol, metric: metric));
  }

  Future<List<Recommendation>> getRecommendation(String symbol) async {
    return _handleFuture<List<Recommendation>>(
        _finHubApi.getRecommendation(token: Constants.apiKey, symbol: symbol));
  }

  Future<Candles> getCandles(String symbol, Resolution resolution,
      String fromTime, String toTime) async {
    return _handleFuture<Candles>(_finHubApi.getCandles(
        token: Constants.apiKey,
        symbol: symbol,
        resolution: fromResolutionToString(resolution),
        fromTime: fromTime,
        toTime: toTime));
  }

  Future<PatternRecognition> getPatternRecognition(
      String symbol, Resolution resolution) async {
    return _handleFuture<PatternRecognition>(_finHubApi.getPatternRecognition(
        token: Constants.apiKey,
        symbol: symbol,
        resolution: fromResolutionToString(resolution)));
  }

  Future<SupportAndResistanceLevel> getSupportResistanceLevel(
      String symbol, Resolution resolution) async {
    return _handleFuture<SupportAndResistanceLevel>(
        _finHubApi.getSupportAndResistanceLevel(
            token: Constants.apiKey,
            symbol: symbol,
            resolution: fromResolutionToString(resolution)));
  }

  Future<AggregateIndicators> getAggregateIndicators(
      String symbol, Resolution resolution) async {
    return _handleFuture<AggregateIndicators>(_finHubApi.getAggregateIndicators(
        token: Constants.apiKey,
        symbol: symbol,
        resolution: fromResolutionToString(resolution)));
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
