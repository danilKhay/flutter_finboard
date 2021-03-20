import 'package:dio/dio.dart';
import 'package:finboard_app/entities/company_profile.dart';
import 'package:finboard_app/entities/executive.dart';
import 'package:retrofit/http.dart';

import '../../entities/entities.dart';

part 'finhub_api.g.dart';

@RestApi(baseUrl: 'https://finnhub.io/api/v1')
abstract class FinHubApi {
  factory FinHubApi(Dio dio, {String baseUrl}) = _FinHubApi;

  @GET('/search')
  Future<SearchSymbolsResult> searchSymbolsByName({
    @Query('token') String token,
    @Query('q') String searchQuery,
  });

  @GET('/stock/symbol')
  Future<List<Stock>> getStocks({
    @Query('token') String token,
    @Query('exchange') String exchange,
  });

  @GET('/stock/profile')
  Future<CompanyProfile> getCompanyProfile({
    @Query('token') String token,
    @Query('symbol') String symbol,
  });

  @GET('/stock/executive')
  Future<Executives> getExecutives({
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
}
