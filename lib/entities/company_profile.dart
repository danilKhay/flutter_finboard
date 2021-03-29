class CompanyProfile {
  String country;
  String currency;
  String exchange;
  String ipo;
  double marketCapitalization;
  String name;
  String phone;
  double shareOutstanding;
  String ticker;
  String weburl;
  String logo;
  String finnhubIndustry;

  CompanyProfile(
      {this.country,
        this.currency,
        this.exchange,
        this.ipo,
        this.marketCapitalization,
        this.name,
        this.phone,
        this.shareOutstanding,
        this.ticker,
        this.weburl,
        this.logo,
        this.finnhubIndustry});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    currency = json['currency'];
    exchange = json['exchange'];
    ipo = json['ipo'];
    marketCapitalization = json['marketCapitalization'];
    name = json['name'];
    phone = json['phone'];
    shareOutstanding = json['shareOutstanding'];
    ticker = json['ticker'];
    weburl = json['weburl'];
    logo = json['logo'];
    finnhubIndustry = json['finnhubIndustry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['exchange'] = this.exchange;
    data['ipo'] = this.ipo;
    data['marketCapitalization'] = this.marketCapitalization;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['shareOutstanding'] = this.shareOutstanding;
    data['ticker'] = this.ticker;
    data['weburl'] = this.weburl;
    data['logo'] = this.logo;
    data['finnhubIndustry'] = this.finnhubIndustry;
    return data;
  }
}