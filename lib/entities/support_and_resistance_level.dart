/// levels : [1.092360019683838,1.1026300191879272,1.113450050354004,1.1233500242233276,1.134719967842102,1.1513700485229492]

class SupportAndResistanceLevel {
  List<double> _levels;

  List<double> get levels => _levels;

  SupportAndResistanceLevel({
      List<double> levels}){
    _levels = levels;
}

  SupportAndResistanceLevel.fromJson(dynamic json) {
    _levels = json["levels"] != null ? json["levels"].cast<double>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["levels"] = _levels;
    return map;
  }

}