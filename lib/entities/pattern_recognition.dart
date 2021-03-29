/// points : [{"aprice":118.39,"atime":1614038400,"bprice":128.72,"btime":1614643200,"cprice":116.21,"ctime":1615161600,"dprice":0,"dtime":0,"end_price":128.72,"end_time":1616976000,"entry":128.72,"eprice":0,"etime":0,"mature":0,"patternname":"Double Bottom","patterntype":"bullish","profit1":141.23,"profit2":0,"sortTime":1616976000,"start_price":128.72,"start_time":1613952000,"status":"incomplete","stoploss":114.959,"symbol":"AAPL.US","terminal":0},{"aprice":118.39,"atime":1614038400,"bprice":128.72,"btime":1614643200,"cprice":116.21,"ctime":1615161600,"dprice":127.22,"dtime":1615852800,"end_price":126.46999999999998,"end_time":1616457600,"entry":126.47,"eprice":119.675,"etime":1616112000,"mature":0,"patternname":"Head And Shoulders","patterntype":"bullish","profit1":137.981,"profit2":0,"sortTime":1616457600,"start_price":130.22,"start_time":1613433600,"status":"incomplete","stoploss":114.959,"symbol":"AAPL.US","terminal":0},{"aprice":128.72,"atime":1614643200,"bprice":116.21,"btime":1615161600,"cprice":127.22,"ctime":1615852800,"dprice":119.675,"dtime":1616112000,"entry":120.83,"entry_date":1616544000,"intersect_price":124.78074766355155,"intersect_time":1617494400,"mature":1,"patternname":"Triangle","patterntype":"bearish","profit1":108.32,"profit2":0,"sortTime":1616112000,"status":"complete","stoploss":128.8487,"symbol":"AAPL.US","terminal":0},{"aprice":138.789,"atime":1609200000,"bprice":126.382,"btime":1609891200,"cprice":145.09,"ctime":1611532800,"dprice":0,"dtime":0,"end_price":126.382,"end_time":1613952000,"entry":126.382,"eprice":0,"etime":0,"mature":0,"patternname":"Double Top","patterntype":"bearish","profit1":107.674,"profit2":0,"sortTime":1613952000,"start_price":126.382,"start_time":1608508800,"status":"complete","stoploss":146.9608,"symbol":"AAPL.US","terminal":0},{"aprice":103.1,"atime":1600646400,"bprice":112.86,"btime":1600732800,"cprice":105,"ctime":1600905600,"dprice":0,"dtime":0,"end_price":112.86,"end_time":1601251200,"entry":112.86,"eprice":0,"etime":0,"mature":0,"patternname":"Double Bottom","patterntype":"bullish","profit1":122.62,"profit2":0,"sortTime":1601251200,"start_price":112.86,"start_time":1600214400,"status":"successful","stoploss":102.124,"symbol":"AAPL.US","terminal":0}]

class PatternRecognition {
  List<Points> _points;

  List<Points> get points => _points;

  PatternRecognition({
      List<Points> points}){
    _points = points;
}

  PatternRecognition.fromJson(dynamic json) {
    if (json["points"] != null) {
      _points = [];
      json["points"].forEach((v) {
        _points.add(Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_points != null) {
      map["points"] = _points.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// aprice : 118.39
/// atime : 1614038400
/// bprice : 128.72
/// btime : 1614643200
/// cprice : 116.21
/// ctime : 1615161600
/// dprice : 0
/// dtime : 0
/// end_price : 128.72
/// end_time : 1616976000
/// entry : 128.72
/// eprice : 0
/// etime : 0
/// mature : 0
/// patternname : "Double Bottom"
/// patterntype : "bullish"
/// profit1 : 141.23
/// profit2 : 0
/// sortTime : 1616976000
/// start_price : 128.72
/// start_time : 1613952000
/// status : "incomplete"
/// stoploss : 114.959
/// symbol : "AAPL.US"
/// terminal : 0

class Points {
  double _aprice;
  int _atime;
  double _bprice;
  int _btime;
  double _cprice;
  int _ctime;
  int _dprice;
  int _dtime;
  double _endPrice;
  int _endTime;
  double _entry;
  int _eprice;
  int _etime;
  int _mature;
  String _patternname;
  String _patterntype;
  double _profit1;
  int _profit2;
  int _sortTime;
  double _startPrice;
  int _startTime;
  String _status;
  double _stoploss;
  String _symbol;
  int _terminal;

  double get aprice => _aprice;
  int get atime => _atime;
  double get bprice => _bprice;
  int get btime => _btime;
  double get cprice => _cprice;
  int get ctime => _ctime;
  int get dprice => _dprice;
  int get dtime => _dtime;
  double get endPrice => _endPrice;
  int get endTime => _endTime;
  double get entry => _entry;
  int get eprice => _eprice;
  int get etime => _etime;
  int get mature => _mature;
  String get patternname => _patternname;
  String get patterntype => _patterntype;
  double get profit1 => _profit1;
  int get profit2 => _profit2;
  int get sortTime => _sortTime;
  double get startPrice => _startPrice;
  int get startTime => _startTime;
  String get status => _status;
  double get stoploss => _stoploss;
  String get symbol => _symbol;
  int get terminal => _terminal;

  Points({
      double aprice, 
      int atime, 
      double bprice, 
      int btime, 
      double cprice, 
      int ctime, 
      int dprice, 
      int dtime, 
      double endPrice, 
      int endTime, 
      double entry, 
      int eprice, 
      int etime, 
      int mature, 
      String patternname, 
      String patterntype, 
      double profit1, 
      int profit2, 
      int sortTime, 
      double startPrice, 
      int startTime, 
      String status, 
      double stoploss, 
      String symbol, 
      int terminal}){
    _aprice = aprice;
    _atime = atime;
    _bprice = bprice;
    _btime = btime;
    _cprice = cprice;
    _ctime = ctime;
    _dprice = dprice;
    _dtime = dtime;
    _endPrice = endPrice;
    _endTime = endTime;
    _entry = entry;
    _eprice = eprice;
    _etime = etime;
    _mature = mature;
    _patternname = patternname;
    _patterntype = patterntype;
    _profit1 = profit1;
    _profit2 = profit2;
    _sortTime = sortTime;
    _startPrice = startPrice;
    _startTime = startTime;
    _status = status;
    _stoploss = stoploss;
    _symbol = symbol;
    _terminal = terminal;
}

  Points.fromJson(dynamic json) {
    _aprice = json["aprice"];
    _atime = json["atime"];
    _bprice = json["bprice"];
    _btime = json["btime"];
    _cprice = json["cprice"];
    _ctime = json["ctime"];
    _dprice = json["dprice"];
    _dtime = json["dtime"];
    _endPrice = json["end_price"];
    _endTime = json["end_time"];
    _entry = json["entry"];
    _eprice = json["eprice"];
    _etime = json["etime"];
    _mature = json["mature"];
    _patternname = json["patternname"];
    _patterntype = json["patterntype"];
    _profit1 = json["profit1"];
    _profit2 = json["profit2"];
    _sortTime = json["sortTime"];
    _startPrice = json["start_price"];
    _startTime = json["start_time"];
    _status = json["status"];
    _stoploss = json["stoploss"];
    _symbol = json["symbol"];
    _terminal = json["terminal"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["aprice"] = _aprice;
    map["atime"] = _atime;
    map["bprice"] = _bprice;
    map["btime"] = _btime;
    map["cprice"] = _cprice;
    map["ctime"] = _ctime;
    map["dprice"] = _dprice;
    map["dtime"] = _dtime;
    map["end_price"] = _endPrice;
    map["end_time"] = _endTime;
    map["entry"] = _entry;
    map["eprice"] = _eprice;
    map["etime"] = _etime;
    map["mature"] = _mature;
    map["patternname"] = _patternname;
    map["patterntype"] = _patterntype;
    map["profit1"] = _profit1;
    map["profit2"] = _profit2;
    map["sortTime"] = _sortTime;
    map["start_price"] = _startPrice;
    map["start_time"] = _startTime;
    map["status"] = _status;
    map["stoploss"] = _stoploss;
    map["symbol"] = _symbol;
    map["terminal"] = _terminal;
    return map;
  }

}