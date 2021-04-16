import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/column_chart_data.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/repositories/chart_repository.dart';
import 'package:finboard_app/repositories/company_repository.dart';
import 'package:finboard_app/widgets/charts/column_chart.dart';
import 'package:finboard_app/widgets/charts/open_close_chart.dart';
import 'package:finboard_app/widgets/charts/range_chart.dart';
import 'package:finboard_app/widgets/company_news_list.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:finboard_app/widgets/news_sentiment_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CompanyProfileModel _cp;
  List<CompanyNews> _list;
  CandlesModel _candlesModel;
  CompanyNewsSentiment _companyNewsSentiment;
  List<ColumnChartData> _columnList;

  @override
  void initState() {
    super.initState();
    final symbol = 'TSLA';
    final repo = serviceLocator.get<CompanyRepository>();
    repo.getCompanyProfile(symbol).then((value) =>
        setState(() => value.fold((l) => _cp = null, (r) => _cp = r)));
    final today = DateTime.now();
    final fifteenDaysAgo = today.subtract(Duration(days: 15));
    repo.getCompanyNews(symbol, fifteenDaysAgo, today).then((value) =>
        setState(() => value.fold((l) => _list = null, (r) => _list = r)));
    final fortyFiveDayAgo = today.subtract(Duration(days: 45));
    final chartRepo = serviceLocator.get<ChartRepository>();
    chartRepo
        .getCandleChartData(symbol, fortyFiveDayAgo, today, Resolution.DAY)
        .then((value) => setState(() =>
            value.fold((l) => _candlesModel = null, (r) => _candlesModel = r)));
    repo.getCompanyNewsSentiment(symbol).then((value) => setState(() =>
        value.fold((l) => _companyNewsSentiment = null,
            (r) => _companyNewsSentiment = r)));
    chartRepo
        .getColumnChartData(symbol).then((value) => setState(() => value.fold((l) => _columnList = null, (r) => _columnList = r)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinBoard'),
      ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              child: Loading(),
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
                  if (_candlesModel != null)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child:
                              HiloOpenCloseChart(Key('fsafsaf'), _candlesModel),
                        ),
                      ),
                    ),
                  if (_candlesModel == null)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Center(
                            child: Loading(),
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
