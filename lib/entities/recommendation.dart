/// buy : 13
/// hold : 14
/// period : "2018-04-01"
/// sell : 1
/// strongBuy : 10
/// strongSell : 1
/// symbol : "NVDA"

class Recommendation {
  int _buy;
  int _hold;
  String _period;
  int _sell;
  int _strongBuy;
  int _strongSell;
  String _symbol;

  int get buy => _buy;
  int get hold => _hold;
  String get period => _period;
  int get sell => _sell;
  int get strongBuy => _strongBuy;
  int get strongSell => _strongSell;
  String get symbol => _symbol;

  Recommendation({
      int buy, 
      int hold, 
      String period, 
      int sell, 
      int strongBuy, 
      int strongSell, 
      String symbol}){
    _buy = buy;
    _hold = hold;
    _period = period;
    _sell = sell;
    _strongBuy = strongBuy;
    _strongSell = strongSell;
    _symbol = symbol;
}

  Recommendation.fromJson(dynamic json) {
    _buy = json["buy"];
    _hold = json["hold"];
    _period = json["period"];
    _sell = json["sell"];
    _strongBuy = json["strongBuy"];
    _strongSell = json["strongSell"];
    _symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["buy"] = _buy;
    map["hold"] = _hold;
    map["period"] = _period;
    map["sell"] = _sell;
    map["strongBuy"] = _strongBuy;
    map["strongSell"] = _strongSell;
    map["symbol"] = _symbol;
    return map;
  }

}