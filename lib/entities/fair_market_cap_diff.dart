class FairMarketCapDiff {
  List<FairMarketCapDiffData> data;

  FairMarketCapDiff({this.data});

  FairMarketCapDiff.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new FairMarketCapDiffData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FairMarketCapDiffData {
  String date;
  double fairMarketcapViaDiff;

  FairMarketCapDiffData({this.date, this.fairMarketcapViaDiff});

  FairMarketCapDiffData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    fairMarketcapViaDiff = json['fair_marketcap_via_diff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['fair_marketcap_via_diff'] = this.fairMarketcapViaDiff;
    return data;
  }
}