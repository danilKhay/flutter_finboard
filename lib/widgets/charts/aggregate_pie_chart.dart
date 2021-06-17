import 'package:finboard_app/models/aggregate_chart_data.dart';
/// Package imports
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Render the semi pie series.
class SemiPieChart extends StatefulWidget {
  final List<AggregateChartData> aggregateList;
  /// Creates the semi pie series.
  const SemiPieChart(Key key, this.aggregateList) : super(key: key);

  @override
  _SemiPieChartState createState() => _SemiPieChartState();
}

class _SemiPieChartState extends State<SemiPieChart> {
  _SemiPieChartState();
  TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y indicators');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSemiPieChartChart();
  }

  /// Return the circular chart with semi pie series.
  SfCircularChart _buildSemiPieChartChart() {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      centerY: '50%',
      title: ChartTitle(
          text: 'Aggregate Indicators'),
      legend: Legend(
          position: LegendPosition.bottom,
          orientation: LegendItemOrientation.horizontal, toggleSeriesVisibility: true,
          isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
      series: _getSemiPieChartSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Return the semi pie series.
  List<PieSeries<AggregateChartData, String>> _getSemiPieChartSeries() {
    return <PieSeries<AggregateChartData, String>>[
      PieSeries<AggregateChartData, String>(
          dataSource: widget.aggregateList,
          xValueMapper: (AggregateChartData data, _) => data.name,
          pointColorMapper: (AggregateChartData data, _) => data.color,
          yValueMapper: (AggregateChartData data, _) => data.count,
          dataLabelMapper: (AggregateChartData data, _) => data.name,
          dataLabelSettings: DataLabelSettings(
            isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          )
    ];
  }
}