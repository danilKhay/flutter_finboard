import 'package:dio/dio.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/utils/constants.dart';
import 'package:retrofit/http.dart';

part 'back_api.g.dart';

@RestApi(baseUrl: Constants.backApiBaseUrl)
abstract class BackApi {
  factory BackApi(Dio dio, {String baseUrl}) = _BackApi;

  @GET('/daily_marketcap')
  Future<DailyMarketCap> getDailyMarketCap({
    @Query('ticker') String symbol,
  });

  @GET('/pipelines/fair_marketcap')
  Future<FairMarketCap> getFairMarketCap({
    @Query('ticker') String symbol,
  });

  @GET('/pipelines/fair_marketcap_via_diff')
  Future<FairMarketCapDiff> getFairMarketCapDiff({
    @Query('ticker') String symbol,
  });

  @GET('/pipelines/down_percentile')
  Future<MarketCapDownLevel> getMarketCapDownLevel({
    @Query('ticker') String symbol,
    @Query('percentile') String percentile,
  });
}