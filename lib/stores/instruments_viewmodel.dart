import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/company_news.dart';
import 'package:finboard_app/entities/company_news_sentiment.dart';
import 'package:finboard_app/models/aggregate_chart_data.dart';
import 'package:finboard_app/models/column_chart_data.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/repositories/contracts/chart_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:mobx/mobx.dart';

part 'instruments_viewmodel.g.dart';

class InstrumentsViewModel = _InstrumentsViewModelBase with _$InstrumentsViewModel;

abstract class _InstrumentsViewModelBase with Store {
  final companyRepo = serviceLocator.get<CompanyRepositoryContract>();
  final chartRepo = serviceLocator.get<ChartRepositoryContract>();

  CompanyProfileModel companyProfileModel;
  List<CompanyNews> companyNews;
  CompanyNewsSentiment companyNewsSentiment;
  List<ColumnChartData> recommendations;
  List<AggregateChartData> aggregateSignal;

  @observable
  LoadingState companyLoadingState = LoadingState.initial;
  @observable
  LoadingState companyNewsLoadingState = LoadingState.initial;
  @observable
  LoadingState companyNewsSentimentState = LoadingState.initial;
  @observable
  LoadingState recommendationState = LoadingState.initial;
  @observable
  LoadingState aggregateSignalState = LoadingState.initial;

  @action
  Future getCompanyProfile(String symbol) async {
    companyLoadingState = LoadingState.loading;
    if (companyProfileModel == null) {
      final result = await companyRepo.getCompanyProfile(symbol);
      result.fold((l) => companyLoadingState = LoadingState.error, (r) {
        companyProfileModel = r;
        companyLoadingState = LoadingState.success;
      });
    } else {
      companyLoadingState = LoadingState.success;
    }
  }

  @action
  Future refreshCompanyProfile(String symbol) async {
    companyLoadingState = LoadingState.initial;
    companyProfileModel = null;
    await getCompanyProfile(symbol);
  }

  @action
  Future getCompanyNews(String symbol) async {
    companyNewsLoadingState = LoadingState.loading;
    if (companyNews == null) {
      final today = DateTime.now();
      final sevenDaysAgo = today.subtract(Duration(days: 7));
      final result = await companyRepo.getCompanyNews(symbol, sevenDaysAgo, today);
      result.fold((l) => companyNewsLoadingState = LoadingState.error, (r) {
        companyNews = r;
        companyNewsLoadingState = LoadingState.success;
      });
    } else {
      companyNewsLoadingState = LoadingState.success;
    }
  }

  @action
  Future refreshCompanyNews(String symbol) async {
    companyNewsLoadingState = LoadingState.initial;
    companyNews = null;
    await getCompanyNews(symbol);
  }

  @action
  Future getCompanyNewsSentiment(String symbol) async {
    companyNewsSentimentState = LoadingState.loading;
    if (companyNewsSentiment == null) {
      final result = await companyRepo.getCompanyNewsSentiment(symbol);
      result.fold((l) => companyNewsSentimentState = LoadingState.error, (r) {
        companyNewsSentiment = r;
        companyNewsSentimentState = LoadingState.success;
      });
    } else {
      companyNewsSentimentState = LoadingState.success;
    }
  }

  @action
  Future refreshCompanyNewsSentiment(String symbol) async {
    companyNewsSentimentState = LoadingState.initial;
    companyNewsSentiment = null;
    await getCompanyNewsSentiment(symbol);
  }

  @action
  Future getRecommendations(String symbol) async {
    recommendationState = LoadingState.loading;
    if (recommendations == null) {
      final result = await chartRepo.getColumnChartData(symbol);
      result.fold((l) => recommendationState = LoadingState.error, (r) {
        recommendations = r;
        recommendationState = LoadingState.success;
      });
    } else {
      recommendationState = LoadingState.success;
    }
  }

  @action
  Future refreshRecommendations(String symbol) async {
    recommendationState = LoadingState.initial;
    recommendations = null;
    await getRecommendations(symbol);
  }

  @action
  Future getAggregateSignal(String symbol) async {
    aggregateSignalState = LoadingState.loading;
    if (aggregateSignal == null) {
      final result = await chartRepo.getAggregateChartData(symbol, Resolution.DAY);
      result.fold((l) => aggregateSignalState = LoadingState.error, (r) {
        aggregateSignal = r;
        aggregateSignalState = LoadingState.success;
      });
    } else {
      aggregateSignalState = LoadingState.success;
    }
  }

  @action
  Future refreshAggregateSignal(String symbol) async {
    aggregateSignalState = LoadingState.initial;
    aggregateSignal = null;
    await getAggregateSignal(symbol);
  }

  @action
  Future loadAll(String symbol) async {
    if (companyLoadingState == LoadingState.initial)
      getCompanyProfile(symbol);
    if (companyNewsLoadingState == LoadingState.initial)
      getCompanyNews(symbol);
    if (companyNewsSentimentState == LoadingState.initial)
      getCompanyNewsSentiment(symbol);
    if (recommendationState == LoadingState.initial)
      getRecommendations(symbol);
    if (aggregateSignalState == LoadingState.initial)
      getAggregateSignal(symbol);
  }

}

enum LoadingState {
  initial,
  loading,
  error,
  success
}