import 'package:finboard_app/stores/app_viewmodel.dart';
import 'package:finboard_app/stores/instruments_viewmodel.dart';
import 'package:finboard_app/stores/main_chart_viewmodel.dart';
import 'package:finboard_app/stores/sentiment_viewmodel.dart';
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
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: Provider(
                          create: (_) => MainChartViewModel(),
                          child: MainChart(Key('MainChart'), symbol),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
        buildSentiment(),
        buildCompanyNews(),
      ],
    );
  }

  Expanded buildCompanyNews() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Observer(builder: (context) {
            return buildObserverResult(
              _instrumentsViewModel.companyNewsLoadingState,
              () {
                return CompanyNewsListWidget(
                    companyNewsList: _instrumentsViewModel.companyNews);
              },
              () {
                _instrumentsViewModel.refreshCompanyNews(symbol);
              },
            );
          }),
        ),
      ),
    );
  }

  Expanded buildSentiment() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Provider(
            create: (_) => SentimentViewModel(),
            child: NewsSentimentWidget(symbol: symbol),
          ),
        ),
      ),
    );
  }


  Row buildThreeTopCards() {
    return Row(
      children: [
        buildCompanyProfile(),
        buildAggregateSignal(),
        buildRecommendations(),
      ],
    );
  }

  Expanded buildRecommendations() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Observer(builder: (context) {
            return buildObserverResult(
              _instrumentsViewModel.recommendationState,
              () {
                return ColumnBack(
                  Key('Recommendations'),
                  _instrumentsViewModel.recommendations,
                );
              },
              () {
                _instrumentsViewModel.refreshRecommendations(symbol);
              },
            );
          }),
        ),
      ),
    );
  }

  Widget buildObserverResult(
      LoadingState loadingState, Function getWidget, Function onRefresh) {
    switch (loadingState) {
      case LoadingState.initial:
        return Container();
      case LoadingState.loading:
        return Loading();
      case LoadingState.success:
        return getWidget();
      case LoadingState.error:
        return MaterialErrorWidget(onRefresh: onRefresh);
      default:
        return Container();
    }
  }

  Expanded buildAggregateSignal() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Observer(builder: (context) {
            return buildObserverResult(
              _instrumentsViewModel.aggregateSignalState,
              () {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SemiPieChart(Key('Aggregate Signal'),
                      _instrumentsViewModel.aggregateSignal),
                );
              },
              () {
                _instrumentsViewModel.refreshAggregateSignal(symbol);
              },
            );
          }),
        ),
      ),
    );
  }

  Expanded buildCompanyProfile() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Observer(builder: (_) {
            return buildObserverResult(
              _instrumentsViewModel.companyLoadingState,
              () {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompanyProfileWidget(
                    cp: _instrumentsViewModel.companyProfileModel,
                  ),
                );
              },
              () {
                _instrumentsViewModel.refreshCompanyProfile(symbol);
              },
            );
          }),
        ),
      ),
    );
  }
}
