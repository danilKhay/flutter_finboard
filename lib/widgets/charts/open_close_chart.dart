import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/res_sup_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/repositories/chart_repository.dart';

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
  ResAndSupModel _resAndSupModel;
  final chartRepo = serviceLocator.get<ChartRepository>();

  @override
  Widget build(BuildContext context) {
    return _buildHiloOpenClose();
  }

  ///Get the cartesian chart with hilo open close series
  Widget _buildHiloOpenClose() {
    final candlesModel = widget.candlesModel;
    double distance = 0;
    double maximum = 0;
    double minimum = 0;
    if (_resAndSupModel != null) {
      distance = _resAndSupModel.max - _resAndSupModel.min;
      minimum = _resAndSupModel.min - distance * 0.1;
      maximum = _resAndSupModel.max + distance * 0.1;
    } else {
      distance = candlesModel.maxPrice - candlesModel.minPrice;
      minimum = candlesModel.minPrice - distance * 0.1;
      maximum = candlesModel.maxPrice + distance * 0.1;
    }

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              if (_resAndSupModel == null) {
                chartRepo.getResAndSupData('TSLA', Resolution.DAY).then(
                    (value) => setState(() => value.fold(
                        (l) => _resAndSupModel = null,
                        (r) => _resAndSupModel = r)));
              } else {
                setState(() {
                  _resAndSupModel = null;
                });
              }
            },
            child: Text('Sup')),
        Expanded(
          child: SfCartesianChart(
            margin: EdgeInsets.all(2),
            plotAreaBorderWidth: 0,
            title: ChartTitle(text: widget.candlesModel.symbol),
            primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.yMMMd(),
                interval: 5,
                intervalType: DateTimeIntervalType.auto,
                majorGridLines: MajorGridLines(width: 1)),
            primaryYAxis: NumericAxis(
                minimum: minimum,
                maximum: maximum,
                interval: distance * 0.1,
                labelFormat: '\${value}',
                axisLine: AxisLine(width: 1)),
            series: _getSeries(
                data: candlesModel, isResAndSup: _resAndSupModel != null),
            trackballBehavior: _trackballBehavior,
          ),
        ),
      ],
    );
  }

  ///Get the hilo open close series
  List<CartesianSeries<CandleChartData, DateTime>> _getSeries(
      {@required CandlesModel data, bool isResAndSup: false}) {
    final List<CartesianSeries<CandleChartData, DateTime>> series = [];
    final CartesianSeries<CandleChartData, DateTime> hilo =
        HiloOpenCloseSeries<CandleChartData, DateTime>(
            bearColor: Colors.red,
            bullColor: Colors.green,
            emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
            dataSource: data.candles,
            name: data.symbol,
            xValueMapper: (CandleChartData sales, _) => sales.date,

            /// High, low, open and close values used to render the HLOC series.
            lowValueMapper: (CandleChartData sales, _) => sales.low,
            highValueMapper: (CandleChartData sales, _) => sales.high,
            openValueMapper: (CandleChartData sales, _) => sales.open,
            closeValueMapper: (CandleChartData sales, _) => sales.close);
    series.add(hilo);
    if (isResAndSup) {
      _resAndSupModel.lines.forEach((element) {
        series.add(
          LineSeries<CandleChartData, DateTime>(
            animationDuration: 2500,
            dataSource: data.candles,
            xValueMapper: (CandleChartData sales, _) => sales.date,
            yValueMapper: (CandleChartData sales, _) => element,
            width: 2,
          ),
        );
      });
    }
    return series;
  }

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
}