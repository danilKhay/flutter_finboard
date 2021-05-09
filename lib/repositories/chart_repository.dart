import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/models/aggregate_chart_data.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/column_chart_data.dart';
import 'package:finboard_app/models/res_sup_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/services/finnhub_rest_service/finnhub_rest_service.dart';
import 'package:finboard_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ChartRepository {
  final FinnhubRestService _finnhubRestService;

  ChartRepository(this._finnhubRestService);

  Future<Either<Failure, CandlesModel>> getCandleChartData(String symbol,
      DateTime fromDate, DateTime toDate, Resolution resolution) async {
    try {
      final candles = await _finnhubRestService.getCandles(
          symbol, resolution, fromDate.toUnixString(), toDate.toUnixString());
      if (candles.status == 'ok') {
        final maxPrice = candles.highPrice.reduce(max);
        final minPrice = candles.lowPrice.reduce(min);
        final List<CandleChartData> list = [];
        final opens = candles.openPrice;
        final closes = candles.closePrice;
        final lows = candles.lowPrice;
        final highs = candles.highPrice;
        final timestamp = candles.timestamp;

        for (int i = 0; i < timestamp.length; i++) {
          list.add(CandleChartData(fromUnixString(timestamp[i]), opens[i],
              closes[i], highs[i], lows[i]));
        }

        return right(CandlesModel(list, symbol, maxPrice, minPrice));
      } else {
        throw 'No Data';
      }
    } catch (e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, List<ColumnChartData>>> getColumnChartData(
      String symbol) async {
    try {
      final list = await _finnhubRestService.getRecommendation(symbol);
      return right(list
          .map((e) => ColumnChartData(
              e.period, e.buy, e.sell, e.hold, e.strongBuy, e.strongSell))
          .toList()
          .sublist(0, 5)
          .reversed
          .toList());
    } catch (e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, List<AggregateChartData>>> getAggregateChartData(String symbol, Resolution resolution) async {
    try {
      final result = await _finnhubRestService.getAggregateIndicators(symbol, resolution);
      final count = result.technicalAnalysis.count;
      return right(
        [
          AggregateChartData('Buy', count.buy, Colors.greenAccent),
          AggregateChartData('Sell', count.sell, Colors.redAccent),
          AggregateChartData('Neutral', count.neutral, Colors.amberAccent),
        ]
      );
    } catch (e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, ResAndSupModel>> getResAndSupData(String symbol, Resolution resolution) async {
    try {
      final result = await _finnhubRestService.getSupportResistanceLevel(symbol, resolution);
      final levels = result.levels;
      final count = levels.length;
      if (count != 0) {
        final maximum = levels.reduce(max);
        final minimum = levels.reduce(min);
        return right(
           ResAndSupModel(levels, count, maximum, minimum)
        );
      } else {
        return left(BasicFailure());
      }

    } catch (e) {
      return left(BasicFailure());
    }
  }
}
