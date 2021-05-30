import 'package:finboard_app/stores/app_viewmodel.dart';
import 'package:finboard_app/stores/instruments_viewmodel.dart';
import 'package:finboard_app/stores/main_chart_viewmodel.dart';
import 'package:finboard_app/widgets/charts/aggregate_pie_chart.dart';
import 'package:finboard_app/widgets/charts/column_chart.dart';
import 'package:finboard_app/widgets/charts/main_chart.dart';
import 'package:finboard_app/widgets/company_news_list.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
import 'package:finboard_app/widgets/error_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:finboard_app/widgets/news_sentiment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/analyze';

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String symbol;
  AppViewModel _appViewModel;
  InstrumentsViewModel _instrumentsViewModel;

  @override
  void didChangeDependencies() {
    _appViewModel ??= Provider.of<AppViewModel>(context);
    _instrumentsViewModel ??= Provider.of<InstrumentsViewModel>(context);
    symbol = _appViewModel.ticker;
    _instrumentsViewModel.loadAll(symbol);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildThreeTopCards(),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildMainChart(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: buildTwoEndCards(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTwoEndCards() {
    return Column(
      children: [
        Observer(builder: (context) {
          return buildObserverResult(
            _instrumentsViewModel.companyNewsSentimentState,
            buildNewsSentiment,
            () {
              _instrumentsViewModel.refreshCompanyNewsSentiment(symbol);
            },
          );
        }),
        Observer(builder: (context) {
          return buildObserverResult(
            _instrumentsViewModel.companyNewsLoadingState,
            buildCompanyNews,
            () {
              _instrumentsViewModel.refreshCompanyNews(symbol);
            },
          );
        }),
      ],
    );
  }

  Expanded buildCompanyNews() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: CompanyNewsListWidget(
            companyNewsList: _instrumentsViewModel.companyNews,
          ),
        ),
      ),
    );
  }

  Expanded buildNewsSentiment() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: NewsSentimentWidget(
            companyNewsSentiment: _instrumentsViewModel.companyNewsSentiment,
          ),
        ),
      ),
    );
  }

  Padding buildMainChart() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Provider(
          create: (_) => MainChartViewModel(),
          child: MainChart(Key('MainChart'), symbol),
        ),
      ),
    );
  }

  Row buildThreeTopCards() {
    return Row(
      children: [
        Observer(builder: (_) {
          return buildObserverResult(
            _instrumentsViewModel.companyLoadingState,
            buildCompanyProfile,
            () {
              _instrumentsViewModel.refreshCompanyProfile(symbol);
            },
          );
        }),
        Observer(builder: (context) {
          return buildObserverResult(
            _instrumentsViewModel.aggregateSignalState,
            buildAggregateSignal,
            () {
              _instrumentsViewModel.refreshAggregateSignal(symbol);
            },
          );
        }),
        Observer(builder: (context) {
          return buildObserverResult(
            _instrumentsViewModel.recommendationState,
            buildRecommendations,
            () {
              _instrumentsViewModel.refreshRecommendations(symbol);
            },
          );
        }),
      ],
    );
  }

  Expanded buildRecommendations() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: ColumnBack(
            Key('Recommendations'),
            _instrumentsViewModel.recommendations,
          ),
        ),
      ),
    );
  }

  Widget buildObserverResult(
      LoadingState loadingState, Function getWidget, Function onRefresh) {
    switch (loadingState) {
      case LoadingState.initial:
        return Expanded(child: Container());
      case LoadingState.loading:
        return buildLoading();
      case LoadingState.success:
        return getWidget();
      case LoadingState.error:
        return MaterialErrorWidget(onRefresh: onRefresh);
      default:
        return Expanded(child: Container());
    }
  }

  Expanded buildAggregateSignal() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: SemiPieChart(
                Key('Aggregate Signal'), _instrumentsViewModel.aggregateSignal),
          ),
        ),
      ),
    );
  }

  Expanded buildCompanyProfile() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CompanyProfileWidget(
          cp: _instrumentsViewModel.companyProfileModel,
        ),
      ),
    );
  }

  Expanded buildLoading() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Loading(),
        ),
      ),
    );
  }
}
