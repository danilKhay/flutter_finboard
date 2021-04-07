class CompanyNewsSentiment {
  Buzz buzz;
  double companyNewsScore;
  double sectorAverageBullishPercent;
  double sectorAverageNewsScore;
  Sentiment sentiment;
  String symbol;

  CompanyNewsSentiment(
      {this.buzz,
        this.companyNewsScore,
        this.sectorAverageBullishPercent,
        this.sectorAverageNewsScore,
        this.sentiment,
        this.symbol});

  CompanyNewsSentiment.fromJson(Map<String, dynamic> json) {
    buzz = json['buzz'] != null ? new Buzz.fromJson(json['buzz']) : null;
    companyNewsScore = json['companyNewsScore'];
    sectorAverageBullishPercent = json['sectorAverageBullishPercent'];
    sectorAverageNewsScore = json['sectorAverageNewsScore'];
    sentiment = json['sentiment'] != null
        ? new Sentiment.fromJson(json['sentiment'])
        : null;
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buzz != null) {
      data['buzz'] = this.buzz.toJson();
    }
    data['companyNewsScore'] = this.companyNewsScore;
    data['sectorAverageBullishPercent'] = this.sectorAverageBullishPercent;
    data['sectorAverageNewsScore'] = this.sectorAverageNewsScore;
    if (this.sentiment != null) {
      data['sentiment'] = this.sentiment.toJson();
    }
    data['symbol'] = this.symbol;
    return data;
  }
}

class Buzz {
  int articlesInLastWeek;
  double buzz;
  double weeklyAverage;

  Buzz({this.articlesInLastWeek, this.buzz, this.weeklyAverage});

  Buzz.fromJson(Map<String, dynamic> json) {
    articlesInLastWeek = json['articlesInLastWeek'];
    buzz = json['buzz'];
    weeklyAverage = json['weeklyAverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['articlesInLastWeek'] = this.articlesInLastWeek;
    data['buzz'] = this.buzz;
    data['weeklyAverage'] = this.weeklyAverage;
    return data;
  }
}

class Sentiment {
  double bearishPercent;
  double bullishPercent;

  Sentiment({this.bearishPercent, this.bullishPercent});

  Sentiment.fromJson(Map<String, dynamic> json) {
    bearishPercent = json['bearishPercent'];
    bullishPercent = json['bullishPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bearishPercent'] = this.bearishPercent;
    data['bullishPercent'] = this.bullishPercent;
    return data;
  }
}