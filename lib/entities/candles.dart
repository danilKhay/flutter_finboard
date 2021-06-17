class Candles {
  List<double> _closePrice;
  List<double> _highPrice;
  List<double> _lowPrice;
  List<double> _openPrice;
  List<int> _timestamp;
  String _status;

  List<double> get closePrice => _closePrice;
  List<double> get highPrice => _highPrice;
  List<double> get lowPrice => _lowPrice;
  List<double> get openPrice => _openPrice;
  List<int> get timestamp => _timestamp;
  String get status => _status;

  Candles({
      List<double> closePrice,
      List<double> highPrice,
      List<double> lowPrice,
      List<double> openPrice,
      List<int> timestamp,
      String status,}){
    _closePrice = closePrice;
    _highPrice = highPrice;
    _lowPrice = lowPrice;
    _openPrice = openPrice;
    _timestamp = timestamp;
    _status = status;
}

  Candles.fromJson(dynamic json) {
    _closePrice = json["c"] != null ? json["c"].cast<double>() : [];
    _highPrice = json["h"] != null ? json["h"].cast<double>() : [];
    _lowPrice = json["l"] != null ? json["l"].cast<double>() : [];
    _openPrice = json["o"] != null ? json["o"].cast<double>() : [];
    _timestamp = json['t'] != null ? json['t'].cast<int>() : [];
    _status = json["s"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["c"] = _closePrice;
    map["h"] = _highPrice;
    map["l"] = _lowPrice;
    map["o"] = _openPrice;
    map['t'] = _timestamp;
    map["s"] = _status;
    return map;
  }

}