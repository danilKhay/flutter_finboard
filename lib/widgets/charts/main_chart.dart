import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/daily_market_cap_model.dart';
import 'package:finboard_app/models/fair_market_cap_diff_model.dart';
import 'package:finboard_app/models/fair_market_cap_model.dart';
import 'package:finboard_app/models/market_cap_down_level_model.dart';
import 'package:finboard_app/stores/main_chart_viewmodel.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Package imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import '../error_widget.dart';

class MainChart extends StatefulWidget {
  final String symbol;

  const MainChart(Key key, this.symbol) : super(key: key);

  @override
  _MainChartState createState() => _MainChartState();
}

class _MainChartState extends State<MainChart> {
  MainChartViewModel _mainChartViewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (_mainChartViewModel.mainChartState) {
        case MainChartState.loading:
          return Expanded(child: Loading());
        case MainChartState.candle:
          return _buildHiloOpenClose(_mainChartViewModel.candlesModel);
        case MainChartState.marketCap:
          return _buildMarketCap(_mainChartViewModel.dailyMarketCap);
        case MainChartState.error:
          return MaterialErrorWidget(onRefresh: () {
            _mainChartViewModel.refresh(widget.symbol);
          },);
        default:
          {
            _mainChartViewModel.getCandleData(widget.symbol);
            return Expanded(child: Loading());
          }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mainChartViewModel ??= Provider.of<MainChartViewModel>(context);
  }

  Widget _buildButtonsMarketCap() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getFair(widget.symbol);
            },
            child: Text('Fair Market Cap'),
          ),
          const SizedBox(width: 2,),
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getFairDiff(widget.symbol);
            },
            child: Text('Fair Market Cap Diff'),
          ),
          const SizedBox(width: 2,),
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getDownLevel(widget.symbol);
            },
            child: Text('90% Down level'),
          ),
          const SizedBox(width: 2,),
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getCandleData(widget.symbol);
            },
            child: Text('Stock price'),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsCandle() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.changeChartType();
            },
            child: Text('Chart type'),
          ),
          const SizedBox(width: 2,),
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getResAndSup(widget.symbol);
            },
            child: Text('Res and Sup'),
          ),
          const SizedBox(width: 2,),
          OutlinedButton(
            onPressed: () {
              _mainChartViewModel.getMarketCap(widget.symbol);
            },
            child: Text('Market Cap'),
          ),
        ],
      ),
    );
  }

  Widget _buildHiloOpenClose(CandlesModel candlesModel) {
    final distance = candlesModel.maxPrice - candlesModel.minPrice;
    final minimum = candlesModel.minPrice - distance * 0.1;
    final maximum = candlesModel.maxPrice + distance * 0.1;

    return Column(
      children: [
        _buildButtonsCandle(),
        Expanded(
          child: Stack(
            children: [
              SfCartesianChart(
                margin: EdgeInsets.all(4),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat.yMd(),
                    interval: 15,
                    intervalType: DateTimeIntervalType.days,
                    majorGridLines: MajorGridLines(width: 1)),
                primaryYAxis: NumericAxis(
                    minimum: minimum,
                    maximum: maximum,
                    interval: distance * 0.1,
                    labelFormat: '\${value}',
                    axisLine: AxisLine(width: 1)),
                series: _getSeries(data: candlesModel),
                crosshairBehavior: CrosshairBehavior(
                    enable: true,
                    hideDelay: 2000,
                    lineWidth: 1,
                    activationMode: ActivationMode.singleTap,
                    shouldAlwaysShow: true,
                    lineType: CrosshairLineType.both),
                zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    zoomMode: ZoomMode.xy,
                    enablePanning: true,
                    enableMouseWheelZooming: true),
              ),
              if (_mainChartViewModel.candleInstruments ==
                  CandleInstruments.loading)
                Loading(),
            ],
          ),
        ),
      ],
    );
  }

  ///Get the hilo open close series
  List<ChartSeries<CandleChartData, DateTime>> _getSeries(
      {@required CandlesModel data}) {
    final List<ChartSeries<CandleChartData, DateTime>> series = [];
    if (_mainChartViewModel.candleState == CandleState.hilo) {
      series.add(getHLOCSeries(data));
    } else {
      series.add(getCandleSeries(data));
    }

    if (_mainChartViewModel.candleInstruments == CandleInstruments.resAndSup) {
      _mainChartViewModel.resAndSupModel.lines.forEach((element) {
        series.add(getResAndSupSeries(element, data));
      });
    }
    return series;
  }

  ChartSeries<CandleChartData, DateTime> getResAndSupSeries(
      double value, CandlesModel data) {
    return LineSeries<CandleChartData, DateTime>(
      animationDuration: 2000,
      dataSource: data.candles,
      xValueMapper: (CandleChartData sales, _) => sales.date,
      yValueMapper: (CandleChartData sales, _) => value,
      width: 2,
    );
  }

  ChartSeries<CandleChartData, DateTime> getHLOCSeries(CandlesModel data) {
    return HiloOpenCloseSeries<CandleChartData, DateTime>(
        bearColor: Colors.red,
        bullColor: Colors.green,
        emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
        dataSource: data.candles,
        xValueMapper: (CandleChartData sales, _) => sales.date,

        /// High, low, open and close values used to render the HLOC series.
        lowValueMapper: (CandleChartData sales, _) => sales.low,
        highValueMapper: (CandleChartData sales, _) => sales.high,
        openValueMapper: (CandleChartData sales, _) => sales.open,
        closeValueMapper: (CandleChartData sales, _) => sales.close);
  }

  ChartSeries<CandleChartData, DateTime> getCandleSeries(CandlesModel data) {
    return CandleSeries<CandleChartData, DateTime>(
        enableSolidCandles: false,
        dataSource: data.candles,
        xValueMapper: (CandleChartData sales, _) => sales.date,

        /// High, low, open and close values used to render the Candle series.
        lowValueMapper: (CandleChartData sales, _) => sales.low,
        highValueMapper: (CandleChartData sales, _) => sales.high,
        openValueMapper: (CandleChartData sales, _) => sales.open,
        closeValueMapper: (CandleChartData sales, _) => sales.close);
  }

  Widget _buildMarketCap(List<DailyMarketCapModel> dailyMarketCapModel) {
    return Column(
      children: [
        _buildButtonsMarketCap(),
        Expanded(
          child: Stack(
            children: [
              SfCartesianChart(
                margin: EdgeInsets.all(4),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat.yMd(),
                    intervalType: DateTimeIntervalType.days,
                    majorGridLines: MajorGridLines(width: 1)),
                primaryYAxis: NumericAxis(
                    labelFormat: '\${value}', axisLine: AxisLine(width: 1)),
                series: [
                  getMarketCapSeries(dailyMarketCapModel),
                  if (_mainChartViewModel.marketCapInstruments ==
                      MarketCapInstruments.fair)
                    getFairMarketCapSeries(_mainChartViewModel.fairMarketCap),
                  if (_mainChartViewModel.marketCapInstruments == MarketCapInstruments.fairDiff)
                    getFairMarketCapDiffSeries(_mainChartViewModel.fairMarketCapDiff),
                  if (_mainChartViewModel.marketCapInstruments == MarketCapInstruments.downLevel)
                    getMarketCapDownLevelSeries(_mainChartViewModel.marketCapDownLevel),
                ],
                crosshairBehavior: CrosshairBehavior(
                    enable: true,
                    hideDelay: 2000,
                    lineWidth: 1,
                    activationMode: ActivationMode.singleTap,
                    shouldAlwaysShow: true,
                    lineType: CrosshairLineType.both),
                zoomPanBehavior: ZoomPanBehavior(
                    /// To enable the pinch zooming as true.
                    enablePinching: true,
                    zoomMode: ZoomMode.xy,
                    enablePanning: true,
                    enableMouseWheelZooming: true),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
              ),
              if (_mainChartViewModel.marketCapInstruments ==
                  MarketCapInstruments.loading)
                Loading(),
            ],
          ),
        ),
      ],
    );
  }

  ChartSeries<DailyMarketCapModel, DateTime> getMarketCapSeries(
      List<DailyMarketCapModel> data) {
    return LineSeries<DailyMarketCapModel, DateTime>(
      name: 'Market Cap',
      animationDuration: 1500,
      dataSource: data,
      xValueMapper: (DailyMarketCapModel sales, _) => sales.dateTime,
      yValueMapper: (DailyMarketCapModel sales, _) => sales.marketcap,
      width: 2,
    );
  }

  ChartSeries<FairMarketCapModel, DateTime> getFairMarketCapSeries(
      List<FairMarketCapModel> data) {
    return LineSeries<FairMarketCapModel, DateTime>(
      name: 'Fair Market Cap',
      animationDuration: 1500,
      dataSource: data,
      xValueMapper: (FairMarketCapModel sales, _) => sales.dateTime,
      yValueMapper: (FairMarketCapModel sales, _) => sales.fairMarketCap,
      width: 2,
      markerSettings: MarkerSettings(isVisible: true),
    );
  }

  ChartSeries<FairMarketCapDiffModel, DateTime> getFairMarketCapDiffSeries(
      List<FairMarketCapDiffModel> data) {
    return LineSeries<FairMarketCapDiffModel, DateTime>(
      name: 'Fair Market Cap Diff',
      animationDuration: 1500,
      dataSource: data,
      xValueMapper: (FairMarketCapDiffModel sales, _) => sales.dateTime,
      yValueMapper: (FairMarketCapDiffModel sales, _) => sales.diff,
      width: 2,
      markerSettings: MarkerSettings(isVisible: true),
    );
  }

  ChartSeries<MarketCapDownLevelModel, DateTime> getMarketCapDownLevelSeries(
      List<MarketCapDownLevelModel> data) {
    return StepLineSeries<MarketCapDownLevelModel, DateTime>(
      name: '90% Down Level (Risk)',
      color: Colors.red,
      animationDuration: 1500,
      dataSource: data,
      xValueMapper: (MarketCapDownLevelModel sales, _) => sales.dateTime,
      yValueMapper: (MarketCapDownLevelModel sales, _) => sales.value,
      width: 2,
      markerSettings: MarkerSettings(isVisible: true),
    );
  }
}
