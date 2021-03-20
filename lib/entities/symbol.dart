class SearchSymbolsResult {
  int count;
  List<Symbol> result;

  SearchSymbolsResult({this.count, this.result});

  SearchSymbolsResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['result'] != null) {
      result = <Symbol>[];
      json['result'].forEach((v) {
        result.add(Symbol.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symbol {
  String description;
  String displaySymbol;
  String symbol;
  String type;

  Symbol({this.description, this.displaySymbol, this.symbol, this.type});

  Symbol.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    symbol = json['symbol'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['displaySymbol'] = this.displaySymbol;
    data['symbol'] = this.symbol;
    data['type'] = this.type;
    return data;
  }
}