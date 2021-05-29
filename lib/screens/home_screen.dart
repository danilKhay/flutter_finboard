import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/aggregate_chart_data.dart';
import 'package:finboard_app/models/column_chart_data.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/repositories/contracts/chart_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:finboard_app/stores/app_viewmodel.dart';
import 'package:finboard_app/stores/main_chart_viewmodel.dart';
import 'package:finboard_app/widgets/charts/aggregate_pie_chart.dart';
import 'package:finboard_app/widgets/charts/column_chart.dart';
import 'package:finboard_app/widgets/charts/main_chart.dart';
import 'package:finboard_app/widgets/company_news_list.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:finboard_app/widgets/news_sentiment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/analyze';

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CompanyProfileModel _cp;
  List<CompanyNews> _list;
  CompanyNewsSentiment _companyNewsSentiment;
  List<ColumnChartData> _columnList;
  List<AggregateChartData> _aggregateList;
  String symbol;
  AppViewModel _appViewModel;

  @override
  void didChangeDependencies() {
    _appViewModel ??= Provider.of<AppViewModel>(context);
    symbol = _appViewModel.ticker;
    final repo = serviceLocator.get<CompanyRepositoryContract>();
    repo.getCompanyProfile(symbol).then((value) =>
        setState(() => value.fold((l) => _cp = null, (r) => _cp = r)));
    final today = DateTime.now();
    final sevenDaysAgo = today.subtract(Duration(days: 7));
    repo.getCompanyNews(symbol, sevenDaysAgo, today).then((value) =>
        setState(() => value.fold((l) => _list = null, (r) => _list = r)));
    final chartRepo = serviceLocator.get<ChartRepositoryContract>();
    repo.getCompanyNewsSentiment(symbol).then((value) => setState(() =>
        value.fold((l) => _companyNewsSentiment = null,
                (r) => _companyNewsSentiment = r)));
    chartRepo
        .getColumnChartData(symbol).then((value) => setState(() => value.fold((l) => _columnList = null, (r) => _columnList = r)));
    chartRepo.getAggregateChartData(symbol, Resolution.DAY).then((value) => setState(() => value.fold((l) => _aggregateList = null, (r) => _aggregateList = r)));
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
                    child: Row(
                      children: [
                        if (_cp != null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CompanyProfileWidget(
                                cp: _cp,
                              ),
                            ),
                          ),
                        if (_cp == null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: Loading(),
                              ),
                            ),
                          ),
                        if (_aggregateList == null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: Loading(),
                              ),
                            ),
                          ),
                        if (_aggregateList != null)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: SemiPieChart(Key('fsag'), _aggregateList),
                              ),
                            ),
                          ),
                        ),
                        if (_columnList == null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: Loading(),
                              ),
                            ),
                          ),
                        if (_columnList != null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: ColumnBack(Key('fsafa'), _columnList,),
                              ),
                            ),
                          ),
                      ],
                    ),
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
              flex: 1,
              child: Column(
                children: [
                  if (_companyNewsSentiment != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: NewsSentimentWidget(
                            companyNewsSentiment: _companyNewsSentiment,
                          ),
                        ),
                      ),
                    ),
                  if (_companyNewsSentiment == null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Loading(),
                        ),
                      ),
                    ),
                  if (_list == null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Loading(),
                        ),
                      ),
                    ),
                  if (_list != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: CompanyNewsListWidget(
                            companyNewsList: _list,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
