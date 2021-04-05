/// c : [519.59,529.48,542.27,541.22,546.57,543.64,577.55,570.53,590.57,610.03,598.45,613.21,596.24,593.16,597.06,574.23,565.68,579.96,532.3,548.58,553.67,536.25,512.19,494.81,498.46,463.73,500.81,498.73,519.74,514.24,527.65,531.65,533.65,508.9,513.83,527.45,522.83,505.72,501.41,513.57,515.3]
/// h : [533.39,530.83,542.88,557.27,546.94,549.49,578.95,583.33,596.2,610.89,611.6455,614.9,608.9407,594.93,607.0799,605.33,569.55,580.27,574.99,554.18,557,556.82,538.06,519,502,498.85,504.67,519.2,521.85,515.55,528.27,540.5,538.13,527.36,516.86,535.78,533.78,526.365,508.59,514.25,518.97]
/// l : [516.4602,516.11,531.4199,540.66,533.5145,541.83,549.0886,568.9,573.655,597,591,598,591.2,583,593.868,573,535.58,550.24,528.65,534.44,542.1299,535.84,511.95,483.35,467.17,462.66,482.37,498.3,509.38,503.6,510.685,524.67,519.58,508.6817,504.5,516.27,520.85,505.47,490.88,494.94,511.1639]
/// o : [523,522.1335,535.95,545.44,541.24,549,549.0886,573.625,578.53,599.21,602,602.57,606.84,589.16,600.98,590.99,563.01,564.91,561.8167,550.1,555,556,537.05,512.03,502,498,485.21,513.62,518,505.93,514.59,534.26,521.59,525.46,510,516.51,530.17,526.05,499.98,502.18,512.81]
/// s : "ok"
/// t : [1611878400,1612137600,1612224000,1612310400,1612396800,1612483200,1612742400,1612828800,1612915200,1613001600,1613088000,1613433600,1613520000,1613606400,1613692800,1613952000,1614038400,1614124800,1614211200,1614297600,1614556800,1614643200,1614729600,1614816000,1614902400,1615161600,1615248000,1615334400,1615420800,1615507200,1615766400,1615852800,1615939200,1616025600,1616112000,1616371200,1616457600,1616544000,1616630400,1616716800,1616976000]
/// v : [6788801,5430108,5510957,6135232,5033462,4228841,10865571,7189003,12133808,11270693,9368937,8048988,6892467,5852020,6793103,8147139,9794483,11207977,20610901,12523260,8829575,6602853,9439757,14333629,13570971,13577792,13045638,9609414,7497857,6099099,5563011,6803240,6096605,7354702,7480174,7445077,5551152,6145963,7378614,9095500,708999]

class Candles {
  List<double> _c;
  List<double> _h;
  List<double> _l;
  List<int> _o;
  String _s;
  List<int> _t;
  List<int> _v;

  List<double> get c => _c;
  List<double> get h => _h;
  List<double> get l => _l;
  List<int> get o => _o;
  String get s => _s;
  List<int> get t => _t;
  List<int> get v => _v;

  Candles({
      List<double> c, 
      List<double> h, 
      List<double> l, 
      List<int> o, 
      String s, 
      List<int> t, 
      List<int> v}){
    _c = c;
    _h = h;
    _l = l;
    _o = o;
    _s = s;
    _t = t;
    _v = v;
}

  Candles.fromJson(dynamic json) {
    _c = json["c"] != null ? json["c"].cast<double>() : [];
    _h = json["h"] != null ? json["h"].cast<double>() : [];
    _l = json["l"] != null ? json["l"].cast<double>() : [];
    _o = json["o"] != null ? json["o"].cast<int>() : [];
    _s = json["s"];
    _t = json["t"] != null ? json["t"].cast<int>() : [];
    _v = json["v"] != null ? json["v"].cast<int>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["c"] = _c;
    map["h"] = _h;
    map["l"] = _l;
    map["o"] = _o;
    map["s"] = _s;
    map["t"] = _t;
    map["v"] = _v;
    return map;
  }

}