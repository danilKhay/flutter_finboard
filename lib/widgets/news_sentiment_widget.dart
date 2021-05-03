import 'package:finboard_app/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NewsSentimentWidget extends StatefulWidget {
  final CompanyNewsSentiment companyNewsSentiment;

  const NewsSentimentWidget({Key key, @required this.companyNewsSentiment})
      : super(key: key);

  @override
  _NewsSentimentWidgetState createState() => _NewsSentimentWidgetState();
}

class _NewsSentimentWidgetState extends State<NewsSentimentWidget> {
  bool _isNewsSentiment;

  @override
  void initState() {
    _isNewsSentiment = true;
    super.initState();
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
              IconButton(icon: Icon(Icons.arrow_back_ios_outlined,), iconSize: 20, padding: EdgeInsets.zero, splashRadius: 20, onPressed: () {
                setState(() {
                  _isNewsSentiment = !_isNewsSentiment;
                });
              }),
              Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: buildTitle(),),),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined,), iconSize: 20, padding: EdgeInsets.zero, splashRadius: 20, onPressed: () {
                setState(() {
                  _isNewsSentiment = !_isNewsSentiment;
                });
              }),
            ],
          ),
        ),
        Divider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: (_isNewsSentiment) ? buildNewsSentiment() : buildBuzz(),
          ),
        ),
      ],
    );
  }

  Widget buildTitle() {
    if (_isNewsSentiment) {
      return Text(
        'News Sentiment',
        style: Theme.of(context).textTheme.headline6,
      );
    } else {
      return Text(
        'Buzz',
        style: Theme.of(context).textTheme.headline6,
      );
    }
  }

  Widget buildBuzz() {
    final buzz = widget.companyNewsSentiment.buzz;
    return Column(
      children: [
        Expanded(child: _buildElevationDoughnutChart(
            buzz.buzz),
        ),
        Text('Articles in last week: ${buzz.articlesInLastWeek}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text('Weekly average of articles: ${buzz.weeklyAverage}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                            child: _buildElevationDoughnutChart(
                                widget.companyNewsSentiment.companyNewsScore),
                          ),
                          Text('Company\'s News\nScore', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: _buildElevationDoughnutChart(
                                widget.companyNewsSentiment
                                    .sentiment.bullishPercent),
                          ),
                          Text('Company\'s Bullish\nPercent', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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
                            child: _buildElevationDoughnutChart(
                                widget.companyNewsSentiment.sectorAverageNewsScore),
                          ),
                          Text('Sector Average\nNews Score', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: _buildElevationDoughnutChart(
                                widget.companyNewsSentiment
                                    .sectorAverageBullishPercent),
                          ),
                          Text('Sector Average\nBullish Percent', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontWeight: FontWeight.bold)),
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
    final secondPercentage = (1.0 - percentage) * 100;
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
