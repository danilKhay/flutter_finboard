import 'package:dio/dio.dart';
import 'package:finboard_app/entities/social_sentiment.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';

import '../../entities/entities.dart';
import '../../utils/constants.dart';

part 'finhub_api.g.dart';

@RestApi(baseUrl: Constants.finnHubBaseUrl)
abstract class FinHubApi {
  factory FinHubApi(Dio dio, {String baseUrl}) = _FinHubApi;

  @GET('/search')
  Future<SearchSymbolsResult> searchSymbolsByName({
    @Query('token') String token,
    @Query('q') String searchQuery,
  });

  @GET('/quote')
  Future<Quote> getQuote({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/stock/symbol')
  Future<List<Stock>> getStocks({
    @Query('token') String token,
    @Query('exchange') String exchange,
  });

  @GET('/stock/profile2')
  Future<CompanyProfile> getCompanyProfile({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/company-news')
  Future<List<CompanyNews>> getCompanyNews({
    @Query('token') String token,
    @Query('symbol') String symbol,
    @Query('from') String fromDate,
    @Query('to') String toDate,
  });

  @GET('/news-sentiment')
  Future<CompanyNewsSentiment> getCompanyNewsSentiment({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/stock/peers')
  Future<List<String>> getPeers({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/stock/metric')
  Future<BasicFinancials> getBasicFinancials({
    @Query('token') String token,
    @Query('symbol') String symbol,
    @Query('metric') String metric,
  });

  @GET('/stock/recommendation')
  Future<List<Recommendation>> getRecommendation({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/stock/candle')
  Future<Candles> getCandles({
    @Query('token') String token,
    @Query('symbol') String symbol,
    // Supported resolution includes 1, 5, 15, 30, 60, D, W, M .Some timeframes might not be available depending on the exchange.
    @Query('resolution') String resolution,
    // UNIX timestamp
    @Query('from') String fromTime,
    @Query('to') String toTime,
  });

  @GET('/scan/pattern')
  Future<PatternRecognition> getPatternRecognition({
    @Query('token') String token,
    @Query('symbol') String symbol,
    // Supported resolution includes 1, 5, 15, 30, 60, D, W, M .Some timeframes might not be available depending on the exchange.
    @Query('resolution') String resolution,
  });

  @GET('/scan/support-resistance')
  Future<SupportAndResistanceLevel> getSupportAndResistanceLevel({
    @Query('token') String token,
    @Query('symbol') String symbol,
    // Supported resolution includes 1, 5, 15, 30, 60, D, W, M .Some timeframes might not be available depending on the exchange.
    @Query('resolution') String resolution,
  });

  @GET('/scan/technical-indicator')
  Future<AggregateIndicators> getAggregateIndicators({
    @Query('token') String token,
    @Query('symbol') String symbol,
    // Supported resolution includes 1, 5, 15, 30, 60, D, W, M .Some timeframes might not be available depending on the exchange.
    @Query('resolution') String resolution,
  });

  @GET('/stock/social-sentiment')
  Future<SocialSentiment> getSocialSentiment({
    @Query('token') String token,
    @Query('symbol') String symbol,
    @Query('from') String fromTime,
    @Query('to') String toTime,
  });
}
