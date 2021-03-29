/// technicalAnalysis : {"count":{"buy":2,"neutral":8,"sell":6},"signal":"neutral"}
/// trend : {"adx":27.261907397628242,"trending":true}

class AggregateIndicators {
  TechnicalAnalysis _technicalAnalysis;
  Trend _trend;

  TechnicalAnalysis get technicalAnalysis => _technicalAnalysis;
  Trend get trend => _trend;

  AggregateIndicators({
      TechnicalAnalysis technicalAnalysis, 
      Trend trend}){
    _technicalAnalysis = technicalAnalysis;
    _trend = trend;
}

  AggregateIndicators.fromJson(dynamic json) {
    _technicalAnalysis = json["technicalAnalysis"] != null ? TechnicalAnalysis.fromJson(json["technicalAnalysis"]) : null;
    _trend = json["trend"] != null ? Trend.fromJson(json["trend"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_technicalAnalysis != null) {
      map["technicalAnalysis"] = _technicalAnalysis.toJson();
    }
    if (_trend != null) {
      map["trend"] = _trend.toJson();
    }
    return map;
  }

}

/// adx : 27.261907397628242
/// trending : true

class Trend {
  double _adx;
  bool _trending;

  double get adx => _adx;
  bool get trending => _trending;

  Trend({
      double adx, 
      bool trending}){
    _adx = adx;
    _trending = trending;
}

  Trend.fromJson(dynamic json) {
    _adx = json["adx"];
    _trending = json["trending"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adx"] = _adx;
    map["trending"] = _trending;
    return map;
  }

}

/// count : {"buy":2,"neutral":8,"sell":6}
/// signal : "neutral"

class TechnicalAnalysis {
  Count _count;
  String _signal;

  Count get count => _count;
  String get signal => _signal;

  TechnicalAnalysis({
      Count count, 
      String signal}){
    _count = count;
    _signal = signal;
}

  TechnicalAnalysis.fromJson(dynamic json) {
    _count = json["count"] != null ? Count.fromJson(json["count"]) : null;
    _signal = json["signal"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_count != null) {
      map["count"] = _count.toJson();
    }
    map["signal"] = _signal;
    return map;
  }

}

/// buy : 2
/// neutral : 8
/// sell : 6

class Count {
  int _buy;
  int _neutral;
  int _sell;

  int get buy => _buy;
  int get neutral => _neutral;
  int get sell => _sell;

  Count({
      int buy, 
      int neutral, 
      int sell}){
    _buy = buy;
    _neutral = neutral;
    _sell = sell;
}

  Count.fromJson(dynamic json) {
    _buy = json["buy"];
    _neutral = json["neutral"];
    _sell = json["sell"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["buy"] = _buy;
    map["neutral"] = _neutral;
    map["sell"] = _sell;
    return map;
  }

}