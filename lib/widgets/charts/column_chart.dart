import 'package:finboard_app/models/column_chart_data.dart';
/// Package imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';


class ColumnBack extends StatefulWidget {

  final List<ColumnChartData> chartData;

  const ColumnBack(Key key, this.chartData) : super(key: key);

  @override
  _ColumnBackState createState() => _ColumnBackState();
}

class _ColumnBackState extends State<ColumnBack> {
  _ColumnBackState();

  @override
  Widget build(BuildContext context) {
    return _buildBackColumnChart();
  }

  SfCartesianChart _buildBackColumnChart() {
    return SfCartesianChart(
        margin: EdgeInsets.all(2),

        plotAreaBorderWidth: 0,
        enableSideBySideSeriesPlacement: true,
        title: ChartTitle(
            text: 'Recommendation Trends'),
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            minimum: 0.0,
            majorTickLines: MajorTickLines(size: 0),
            numberFormat: NumberFormat.compact(),
            majorGridLines: MajorGridLines(width: 0),
            rangePadding: ChartRangePadding.additional),
        series: _getBackToBackColumn(widget.chartData),
        tooltipBehavior: TooltipBehavior(enable: true));
  }

  List<ColumnSeries<ColumnChartData, String>> _getBackToBackColumn(List<ColumnChartData> chartData) {

    return <ColumnSeries<ColumnChartData, String>>[
      ColumnSeries<ColumnChartData, String>(
        color: Colors.greenAccent,
          dataSource: chartData,
          width: 0.8,
          xValueMapper: (ColumnChartData data, _) => data.period,
          yValueMapper: (ColumnChartData data, _) => data.buy,
          name: 'Buy'),
      ColumnSeries<ColumnChartData, String>(
          color: Colors.green,
          dataSource: chartData,
          width: 0.8,
          xValueMapper: (ColumnChartData data, _) => data.period,
          yValueMapper: (ColumnChartData data, _) => data.strongBuy,
          name: 'Strong Buy'),
      ColumnSeries<ColumnChartData, String>(
        color: Colors.amberAccent,
          dataSource: chartData,
          width: 0.8,
          xValueMapper: (ColumnChartData data, _) => data.period,
          yValueMapper: (ColumnChartData data, _) => data.hold,
          name: 'Hold'),
      ColumnSeries<ColumnChartData, String>(
        color: Colors.orange,
          dataSource: chartData,
          width: 0.8,
          xValueMapper: (ColumnChartData data, _) => data.period,
          yValueMapper: (ColumnChartData data, _) => data.sell,
          name: 'Sell'),
      ColumnSeries<ColumnChartData, String>(
        color: Colors.red,
          dataSource: chartData,
          width: 0.8,
          xValueMapper: (ColumnChartData data, _) => data.period,
          yValueMapper: (ColumnChartData data, _) => data.strongSell,
          name: 'Strong Sell'),
    ];
  }
}