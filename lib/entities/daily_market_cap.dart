class DailyMarketCap {
  List<DailyMarketCapData> data;

  DailyMarketCap({this.data});

  DailyMarketCap.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new DailyMarketCapData.fromJson(v));
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

class DailyMarketCapData {
  String date;
  double marketcap;

  DailyMarketCapData({this.date, this.marketcap});

  DailyMarketCapData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    marketcap = json['marketcap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['marketcap'] = this.marketcap;
    return data;
  }
}