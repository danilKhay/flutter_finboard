// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finhub_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FinHubApi implements FinHubApi {
  _FinHubApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://finnhub.io/api/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<SearchSymbolsResult> searchSymbolsByName({token, searchQuery}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'q': searchQuery
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchSymbolsResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Stock>> getStocks({token, exchange}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'exchange': exchange
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/stock/symbol',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Stock.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<CompanyProfile> getCompanyProfile({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/stock/profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CompanyProfile.fromJson(_result.data);
    return value;
  }

  @override
  Future<Executives> getExecutives({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/stock/executive',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Executives.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<CompanyNews>> getCompanyNews(
      {token, symbol, fromDate, toDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'from': fromDate,
      r'to': toDate
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/company-news',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CompanyNews.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
