class Stock {
  String currency;
  String description;
  String displaySymbol;
  String figi;
  String mic;
  String symbol;
  String type;

  Stock(
      {this.currency,
        this.description,
        this.displaySymbol,
        this.figi,
        this.mic,
        this.symbol,
        this.type});

  Stock.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    figi = json['figi'];
    mic = json['mic'];
    symbol = json['symbol'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['displaySymbol'] = this.displaySymbol;
    data['figi'] = this.figi;
    data['mic'] = this.mic;
    data['symbol'] = this.symbol;
    data['type'] = this.type;
    return data;
  }
}