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
  Future<Quote> getQuote({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/quote',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Quote.fromJson(_result.data);
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
    final _result = await _dio.request<Map<String, dynamic>>('/stock/profile2',
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

  @override
  Future<CompanyNewsSentiment> getCompanyNewsSentiment({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/news-sentiment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CompanyNewsSentiment.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<String>> getPeers({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/stock/peers',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return value;
  }

  @override
  Future<BasicFinancials> getBasicFinancials({token, symbol, metric}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'metric': metric
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/stock/metric',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicFinancials.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Recommendation>> getRecommendation({token, symbol}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/stock/recommendation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Recommendation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Candles> getCandles(
      {token, symbol, resolution, fromTime, toTime}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'resolution': resolution,
      r'from': fromTime,
      r'to': toTime
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/stock/candle',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Candles.fromJson(_result.data);
    return value;
  }

  @override
  Future<PatternRecognition> getPatternRecognition(
      {token, symbol, resolution}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'resolution': resolution
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/scan/pattern',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PatternRecognition.fromJson(_result.data);
    return value;
  }

  @override
  Future<SupportAndResistanceLevel> getSupportAndResistanceLevel(
      {token, symbol, resolution}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'resolution': resolution
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/scan/support-resistance',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SupportAndResistanceLevel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AggregateIndicators> getAggregateIndicators(
      {token, symbol, resolution}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'resolution': resolution
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/scan/technical-indicator',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AggregateIndicators.fromJson(_result.data);
    return value;
  }

  @override
  Future<SocialSentiment> getSocialSentiment(
      {token, symbol, fromTime, toTime}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'symbol': symbol,
      r'from': fromTime,
      r'to': toTime
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/stock/social-sentiment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SocialSentiment.fromJson(_result.data);
    return value;
  }
}
