class SocialSentiment {
  List<SocialNetwork> reddit;
  String symbol;
  List<SocialNetwork> twitter;

  SocialSentiment({this.reddit, this.symbol, this.twitter});

  SocialSentiment.fromJson(Map<String, dynamic> json) {
    if (json['reddit'] != null) {
      reddit = [];
      json['reddit'].forEach((v) {
        reddit.add(new SocialNetwork.fromJson(v));
      });
    }
    symbol = json['symbol'];
    if (json['twitter'] != null) {
      twitter = [];
      json['twitter'].forEach((v) {
        twitter.add(new SocialNetwork.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reddit != null) {
      data['reddit'] = this.reddit.map((v) => v.toJson()).toList();
    }
    data['symbol'] = this.symbol;
    if (this.twitter != null) {
      data['twitter'] = this.twitter.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialNetwork {
  String atTime;
  int mention;
  double positiveScore;
  double negativeScore;
  int positiveMention;
  int negativeMention;
  double score;

  SocialNetwork(
      {this.atTime,
        this.mention,
        this.positiveScore,
        this.negativeScore,
        this.positiveMention,
        this.negativeMention,
        this.score});

  SocialNetwork.fromJson(Map<String, dynamic> json) {
    atTime = json['atTime'];
    mention = json['mention'];
    positiveScore = json['positiveScore'];
    negativeScore = json['negativeScore'];
    positiveMention = json['positiveMention'];
    negativeMention = json['negativeMention'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atTime'] = this.atTime;
    data['mention'] = this.mention;
    data['positiveScore'] = this.positiveScore;
    data['negativeScore'] = this.negativeScore;
    data['positiveMention'] = this.positiveMention;
    data['negativeMention'] = this.negativeMention;
    data['score'] = this.score;
    return data;
  }
}