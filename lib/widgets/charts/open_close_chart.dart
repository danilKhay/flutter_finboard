import 'package:finboard_app/models/candle_chart_data.dart';
/// Package imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';


class HiloOpenCloseChart extends StatefulWidget {
  final CandlesModel candlesModel;

  const HiloOpenCloseChart(Key key, this.candlesModel) : super(key: key);

  @override
  _HiloOpenCloseChartState createState() => _HiloOpenCloseChartState();
}

class _HiloOpenCloseChartState extends State<HiloOpenCloseChart> {
  _HiloOpenCloseChartState();
  TrackballBehavior _trackballBehavior;

  @override
  Widget build(BuildContext context) {
    return _buildHiloOpenClose();
  }

  ///Get the cartesian chart with hilo open close series
  SfCartesianChart _buildHiloOpenClose() {
    final distance = widget.candlesModel.maxPrice - widget.candlesModel.minPrice;
    return SfCartesianChart(
      margin: EdgeInsets.all(2),
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: widget.candlesModel.symbol),
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.yMMMd(),
          interval: 5,
          intervalType: DateTimeIntervalType.auto,
          majorGridLines: MajorGridLines(width: 1)),
      primaryYAxis: NumericAxis(
          minimum: widget.candlesModel.minPrice - distance * 0.1,
          maximum: widget.candlesModel.maxPrice + distance * 0.1,
          interval: distance * 0.1 ,
          labelFormat: '\${value}',
          axisLine: AxisLine(width: 1)),
      series: _getHiloOpenCloseSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }

  ///Get the hilo open close series
  List<CartesianSeries<CandleChartData, DateTime>>
  _getHiloOpenCloseSeries() {
    return <CartesianSeries<CandleChartData, DateTime>>[

      HiloOpenCloseSeries<CandleChartData, DateTime>(
          bearColor: Colors.red,
          bullColor: Colors.green,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
          dataSource: widget.candlesModel.candles,
          name: widget.candlesModel.symbol,
          xValueMapper: (CandleChartData sales, _) => sales.date,
          /// High, low, open and close values used to render the HLOC series.
          lowValueMapper: (CandleChartData sales, _) => sales.low,
          highValueMapper: (CandleChartData sales, _) => sales.high,
          openValueMapper: (CandleChartData sales, _) => sales.open,
          closeValueMapper: (CandleChartData sales, _) => sales.close),
    ];
  }

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
}