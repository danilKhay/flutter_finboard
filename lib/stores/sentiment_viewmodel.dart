import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/company_news_sentiment.dart';
import 'package:finboard_app/models/sentiment_type.dart';
import 'package:finboard_app/models/social_sentiment_model.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:mobx/mobx.dart';

part 'sentiment_viewmodel.g.dart';

class SentimentViewModel = _SentimentViewModelBase with _$SentimentViewModel;

abstract class _SentimentViewModelBase with Store {
  final companyRepo = serviceLocator.get<CompanyRepositoryContract>();

  CompanyNewsSentiment companyNewsSentiment;
  SocialSentimentModel socialSentimentModel;
  SentimentType sentimentType = SentimentType.NEWS;

  @observable
  SentimentState companySentimentState = SentimentState.initial;


  @action
  Future getCompanyNewsSentiment(String symbol) async {
    companySentimentState = SentimentState.loading;
    if (companyNewsSentiment == null) {
      final result = await companyRepo.getCompanyNewsSentiment(symbol);
      result.fold((l) => companySentimentState = SentimentState.error, (r) {
        companyNewsSentiment = r;
        companySentimentState = SentimentState.news;
      });
    } else {
      companySentimentState = SentimentState.news;
    }
  }

  @action
  Future getSocialNetworkSentiment(String symbol) async {
    companySentimentState = SentimentState.loading;
    if (socialSentimentModel == null) {
      final result = await companyRepo.getSocialSentiment(symbol);
      result.fold((l) => companySentimentState = SentimentState.error, (r) {
        socialSentimentModel = r;
        companySentimentState = SentimentState.social;
      });
    } else {
      companySentimentState = SentimentState.social;
    }
  }


  @action
  Future getNewsBuzzSentiment(String symbol) async {
    companySentimentState = SentimentState.loading;
    if (companyNewsSentiment == null) {
      final result = await companyRepo.getCompanyNewsSentiment(symbol);
      result.fold((l) => companySentimentState = SentimentState.error, (r) {
        companyNewsSentiment = r;
        companySentimentState = SentimentState.newsBuzz;
      });
    } else {
      companySentimentState = SentimentState.newsBuzz;
    }
  }

  changeSentiment(bool isRight, String symbol) {
    switch(sentimentType) {
      case(SentimentType.NEWS): {
        if (isRight) {
          sentimentType = SentimentType.BUZZ;
          getNewsBuzzSentiment(symbol);
        } else {
          sentimentType = SentimentType.SOCIAL;
          getSocialNetworkSentiment(symbol);
        }
        break;
      }
      case(SentimentType.BUZZ): {
        if (isRight) {
          sentimentType = SentimentType.SOCIAL;
          getSocialNetworkSentiment(symbol);
        } else {
          sentimentType = SentimentType.NEWS;
          getCompanyNewsSentiment(symbol);
        }
        break;
      }
      case(SentimentType.SOCIAL): {
        if (isRight) {
          sentimentType = SentimentType.NEWS;
          getCompanyNewsSentiment(symbol);
        } else {
          sentimentType = SentimentType.BUZZ;
          getNewsBuzzSentiment(symbol);
        }
        break;
      }
    }
  }

  @action
  Future refreshCompanyNewsSentiment(String symbol) async {
    companySentimentState = SentimentState.initial;
    companyNewsSentiment = null;
    socialSentimentModel = null;
    sentimentType = SentimentType.NEWS;
    await getCompanyNewsSentiment(symbol);
  }

  @action
  Future load(String symbol) async {
    if (companySentimentState == SentimentState.initial)
      getCompanyNewsSentiment(symbol);
  }
}


enum SentimentState {
  initial,
  loading,
  error,
  news,
  newsBuzz,
  social
}