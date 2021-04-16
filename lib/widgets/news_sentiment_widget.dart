import 'package:finboard_app/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NewsSentimentWidget extends StatelessWidget {
  final CompanyNewsSentiment companyNewsSentiment;

  const NewsSentimentWidget({Key key, @required this.companyNewsSentiment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'News Sentiment',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Divider(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildElevationDoughnutChart(
                                  companyNewsSentiment.companyNewsScore),
                            ),
                            Text('Company News Score'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildElevationDoughnutChart(
                                  companyNewsSentiment
                                      .sentiment.bullishPercent),
                            ),
                            Text('Company Bullish Percent'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildElevationDoughnutChart(
                                  companyNewsSentiment.sectorAverageNewsScore),
                            ),
                            Text('Sector Average News Score'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildElevationDoughnutChart(
                                  companyNewsSentiment
                                      .sectorAverageBullishPercent),
                            ),
                            Text('Sector Average Bullish Percent'),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5))),
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
          pointColor: const Color.fromRGBO(0, 220, 252, 1)),
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
