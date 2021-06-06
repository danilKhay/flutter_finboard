class SocialSentimentModel {
  final SocialNetworkModel reddit;
  final SocialNetworkModel twitter;

  SocialSentimentModel(this.reddit, this.twitter);
}

class SocialNetworkModel {
  final int mention;
  final int score;

  SocialNetworkModel(this.mention, this.score);
}