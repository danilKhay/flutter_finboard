import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/models/social_sentiment_model.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:finboard_app/services/datasource/finnhub_rest_service.dart';
import '../../utils/utils.dart';

class CompanyRepository implements CompanyRepositoryContract {
  final FinnhubRestService _finnhubRestService;

  CompanyRepository(this._finnhubRestService);

  @override
  Future<Either<Failure, CompanyProfileModel>> getCompanyProfile(
      String symbol) async {
    try {
      final companyProfile =
          await _finnhubRestService.getCompanyProfile(symbol);
      return right(CompanyProfileModel.fromEntity(companyProfile));
    } catch (e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, bool>> isUSCompanySymbol(String symbol) async {
    try {
      final result = await _finnhubRestService.getQuote(symbol);
      if (result.t == 0 && result.pc == 0 && result.o == 0) {
        return left(BasicFailure());
      }
      return right(true);
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, List<CompanyNews>>> getCompanyNews(
      String symbol, DateTime fromDate, DateTime toDate) async {
    try {
      final companyNews = await _finnhubRestService.getCompanyNews(
          symbol, fromDate.toFinnHubString(), toDate.toFinnHubString());
      return right(companyNews);
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, CompanyNewsSentiment>> getCompanyNewsSentiment(
      String symbol) async {
    try {
      final companyNewsSentiment =
          await _finnhubRestService.getCompanyNewsSentiment(symbol);
      return right(companyNewsSentiment);
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, SocialSentimentModel>> getSocialSentiment(
      String symbol) async {
    try {
      final today = DateTime.now();
      final yesterday = today.subtract(Duration(days: 1));
      final tomorrow = today.add(Duration(days: 1));
      final result = await _finnhubRestService.getSocialSentiment(
          symbol, yesterday.toFinnHubString(), tomorrow.toFinnHubString());

      final countReddit = result.reddit.length;
      int mentionReddit = 0;
      double scoreReddit = 0.0;
      result.reddit.forEach((element) {
        mentionReddit += element.mention;
        scoreReddit += element.score;
      });
      scoreReddit = scoreReddit / countReddit;

      final countTwitter = result.twitter.length;
      int mentionTwitter = 0;
      double scoreTwitter = 0.0;
      result.twitter.forEach((element) {
        mentionTwitter += element.mention;
        scoreTwitter += element.score;
      });
      scoreTwitter = scoreTwitter / countTwitter;

      return right(SocialSentimentModel(
          SocialNetworkModel(mentionReddit, (scoreReddit * 100).toInt()),
          SocialNetworkModel(mentionTwitter, (scoreTwitter * 100).toInt())));
    } catch (e) {
      return left(BasicFailure());
    }
  }
}
