class FairMarketCap {
  List<FairMarketCapData> data;

  FairMarketCap({this.data});

  FairMarketCap.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new FairMarketCapData.fromJson(v));
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

class FairMarketCapData {
  String date;
  double fairMarketcap;

  FairMarketCapData({this.date, this.fairMarketcap});

  FairMarketCapData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    fairMarketcap = json['fair_marketcap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['fair_marketcap'] = this.fairMarketcap;
    return data;
  }
}