// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BackApi implements BackApi {
  _BackApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://localhost:8080';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<DailyMarketCap> getDailyMarketCap({symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ticker': symbol};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/daily_marketcap',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DailyMarketCap.fromJson(_result.data);
    return value;
  }

  @override
  Future<FairMarketCap> getFairMarketCap({symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ticker': symbol};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/pipelines/fair_marketcap',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FairMarketCap.fromJson(_result.data);
    return value;
  }

  @override
  Future<FairMarketCapDiff> getFairMarketCapDiff({symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ticker': symbol};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/pipelines/fair_marketcap_via_diff',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FairMarketCapDiff.fromJson(_result.data);
    return value;
  }

  @override
  Future<MarketCapDownLevel> getMarketCapDownLevel({symbol, percentile}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ticker': symbol,
      r'percentile': percentile
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/pipelines/down_percentile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MarketCapDownLevel.fromJson(_result.data);
    return value;
  }
}
