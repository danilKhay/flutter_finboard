import 'package:finboard_app/entities/social_sentiment.dart';
import 'package:finboard_app/models/sentiment_type.dart';
import 'package:finboard_app/stores/instruments_viewmodel.dart';
import 'package:finboard_app/stores/sentiment_viewmodel.dart';
import 'package:finboard_app/widgets/error_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NewsSentimentWidget extends StatefulWidget {
  final String symbol;

  const NewsSentimentWidget({Key key, @required this.symbol}) : super(key: key);

  @override
  _NewsSentimentWidgetState createState() => _NewsSentimentWidgetState();
}

class _NewsSentimentWidgetState extends State<NewsSentimentWidget> {
  SentimentViewModel _sentimentViewModel;

  @override
  void didChangeDependencies() {
    _sentimentViewModel ??= Provider.of<SentimentViewModel>(context);
    _sentimentViewModel.load(widget.symbol);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                  ),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  onPressed: () {
                    _sentimentViewModel.changeSentiment(false, widget.symbol);
                  }),
              Expanded(
                child: Observer(
                  builder: (_) {
                    switch (_sentimentViewModel.companySentimentState) {
                      case SentimentState.news:
                        return buildTitle(SentimentType.NEWS);
                      case SentimentState.newsBuzz:
                        return buildTitle(SentimentType.BUZZ);
                      case SentimentState.social:
                        return buildTitle(SentimentType.SOCIAL);
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  onPressed: () {
                    _sentimentViewModel.changeSentiment(true, widget.symbol);
                  }),
            ],
          ),
        ),
        Divider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Observer(builder: (_) {
              switch (_sentimentViewModel.companySentimentState) {
                case SentimentState.initial:
                  return Container();
                case SentimentState.loading:
                  return Loading();
                case SentimentState.news:
                  return buildNewsSentiment();
                case SentimentState.newsBuzz:
                  return buildBuzz();
                case SentimentState.social:
                  return buildSocialNetwork();
                case SentimentState.error:
                  return MaterialErrorWidget(onRefresh: () {
                    _sentimentViewModel
                        .refreshCompanyNewsSentiment(widget.symbol);
                  });
                default:
                  return Container();
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget buildTitle(SentimentType type) {
    switch (type) {
      case (SentimentType.NEWS):
        {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'News Sentiment',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        }
      case (SentimentType.BUZZ):
        {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Buzz',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        }
      case (SentimentType.SOCIAL):
        {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Social Network Sentiment',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        }
      default:
        return Text('');
    }
  }

  Widget buildSocialNetwork() {
    final socialNetwork = _sentimentViewModel.socialSentimentModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/reddit.png',
                fit: BoxFit.scaleDown,
              )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Tooltip(
                        message: 'Number of mentions for yesterday and today',
                        child: Text('Mentions',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Text(socialNetwork.reddit.mention.toString()),
                      const SizedBox(height: 20),
                      const Tooltip(
                          message:
                              '-100% - absolute negative\n100% - absolute positive',
                          child: Text('Score',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Text('${socialNetwork.reddit.score.toString()}%')
                    ],
                  ))
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/twitter.png',
                fit: BoxFit.scaleDown,
              )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Tooltip(
                        message: 'Number of mentions for yesterday and today',
                        child: Text('Mentions',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        socialNetwork.twitter.mention.toString(),
                      ),
                      const SizedBox(height: 20),
                      const Tooltip(
                          message:
                              '-100% - absolute negative\n100% - absolute positive',
                          child: Text('Score',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Text('${socialNetwork.twitter.score.toString()}%')
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBuzz() {
    final buzz = _sentimentViewModel.companyNewsSentiment.buzz;
    return Column(
      children: [
        Expanded(
          child: _buildElevationDoughnutChart(buzz.buzz),
        ),
        Text('Articles in last week: ${buzz.articlesInLastWeek}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text('Weekly average of articles: ${buzz.weeklyAverage}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Column buildNewsSentiment() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildElevationDoughnutChart(_sentimentViewModel
                          .companyNewsSentiment.companyNewsScore),
                    ),
                    const Tooltip(
                      message: '100% - only positive news\n0% - only negative news',
                      child: Text(
                        'Company\'s News\nScore',
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildElevationDoughnutChart(_sentimentViewModel
                          .companyNewsSentiment.sentiment.bullishPercent),
                    ),
                    Tooltip(
                      message: '100% - absolute bullish trend\n0% - absolute bearish trend',
                      child: Text(
                        'Company\'s Bullish\nPercent',
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildElevationDoughnutChart(_sentimentViewModel
                          .companyNewsSentiment.sectorAverageNewsScore),
                    ),
                    const Tooltip(
                      message: '100% - only positive news\n0% - only negative news',
                      child: Text(
                        'Sector Average\nNews Score',
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildElevationDoughnutChart(_sentimentViewModel
                          .companyNewsSentiment.sectorAverageBullishPercent),
                    ),
                    const Tooltip(
                      message: '100% - absolute bullish trend\n0% - absolute bearish trend',
                      child: Text(
                        'Sector Average\nBullish Percent',
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns the circular charts with center elevation dughnut series.
  SfCircularChart _buildElevationDoughnutChart(double percentage) {
    return SfCircularChart(
      margin: EdgeInsets.zero,

      /// It used to set the annotation on circular chart.
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: Container(
                child: PhysicalModel(
              shape: BoxShape.circle,
              elevation: 10,
              shadowColor: Colors.black,
              color: const Color.fromRGBO(230, 230, 230, 1),
              child: Container(),
            ))),
        CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: Center(
              child: FittedBox(
                child: Text('${(percentage * 100).toStringAsFixed(2)}%',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.bold)),
              ),
            ))
      ],
      series: _getElevationDoughnutSeries(percentage),
    );
  }

  /// Returns the doughnut series which need to be center elevation.
  List<DoughnutSeries<ChartData, String>> _getElevationDoughnutSeries(
      double percentage) {
    final firstPercentage = percentage * 100;
    double secondPercentage;
    if (firstPercentage > 100) {
      secondPercentage = 0;
    } else {
      secondPercentage = (1.0 - percentage) * 100;
    }
    final List<ChartData> chartData = <ChartData>[
      ChartData(
          x: 'A',
          y: firstPercentage,
          pointColor: const Color.fromRGBO(0, 0, 0, 1)),
      ChartData(
          x: 'B',
          y: secondPercentage,
          pointColor: const Color.fromRGBO(230, 230, 230, 1))
    ];

    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          animationDuration: 0,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => data.pointColor)
    ];
  }
}

class ChartData {
  final String x;
  final double y;
  final Color pointColor;

  ChartData({@required this.x, @required this.y, @required this.pointColor});
}
