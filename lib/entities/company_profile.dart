class CompanyProfile {
  String address;
  String city;
  String country;
  String currency;
  String cusip;
  String sedol;
  String description;
  String employeeTotal;
  String exchange;
  String ggroup;
  String gind;
  String gsector;
  String gsubind;
  String ipo;
  String isin;
  int marketCapitalization;
  String naics;
  String naicsNationalIndustry;
  String naicsSector;
  String naicsSubsector;
  String name;
  String phone;
  double shareOutstanding;
  String state;
  String ticker;
  String weburl;
  String logo;
  String finnhubIndustry;

  CompanyProfile(
      {this.address,
        this.city,
        this.country,
        this.currency,
        this.cusip,
        this.sedol,
        this.description,
        this.employeeTotal,
        this.exchange,
        this.ggroup,
        this.gind,
        this.gsector,
        this.gsubind,
        this.ipo,
        this.isin,
        this.marketCapitalization,
        this.naics,
        this.naicsNationalIndustry,
        this.naicsSector,
        this.naicsSubsector,
        this.name,
        this.phone,
        this.shareOutstanding,
        this.state,
        this.ticker,
        this.weburl,
        this.logo,
        this.finnhubIndustry});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    currency = json['currency'];
    cusip = json['cusip'];
    sedol = json['sedol'];
    description = json['description'];
    employeeTotal = json['employeeTotal'];
    exchange = json['exchange'];
    ggroup = json['ggroup'];
    gind = json['gind'];
    gsector = json['gsector'];
    gsubind = json['gsubind'];
    ipo = json['ipo'];
    isin = json['isin'];
    marketCapitalization = json['marketCapitalization'];
    naics = json['naics'];
    naicsNationalIndustry = json['naicsNationalIndustry'];
    naicsSector = json['naicsSector'];
    naicsSubsector = json['naicsSubsector'];
    name = json['name'];
    phone = json['phone'];
    shareOutstanding = json['shareOutstanding'];
    state = json['state'];
    ticker = json['ticker'];
    weburl = json['weburl'];
    logo = json['logo'];
    finnhubIndustry = json['finnhubIndustry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['cusip'] = this.cusip;
    data['sedol'] = this.sedol;
    data['description'] = this.description;
    data['employeeTotal'] = this.employeeTotal;
    data['exchange'] = this.exchange;
    data['ggroup'] = this.ggroup;
    data['gind'] = this.gind;
    data['gsector'] = this.gsector;
    data['gsubind'] = this.gsubind;
    data['ipo'] = this.ipo;
    data['isin'] = this.isin;
    data['marketCapitalization'] = this.marketCapitalization;
    data['naics'] = this.naics;
    data['naicsNationalIndustry'] = this.naicsNationalIndustry;
    data['naicsSector'] = this.naicsSector;
    data['naicsSubsector'] = this.naicsSubsector;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['shareOutstanding'] = this.shareOutstanding;
    data['state'] = this.state;
    data['ticker'] = this.ticker;
    data['weburl'] = this.weburl;
    data['logo'] = this.logo;
    data['finnhubIndustry'] = this.finnhubIndustry;
    return data;
  }
}