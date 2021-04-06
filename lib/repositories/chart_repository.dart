import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/services/finnhub_rest_service/finnhub_rest_service.dart';
import 'package:finboard_app/utils/utils.dart';

class ChartRepository {
  final FinnhubRestService _finnhubRestService;

  ChartRepository(this._finnhubRestService);

  Future<Either<Failure, CandlesModel>> getCandleChartData(String symbol,
      DateTime fromDate, DateTime toDate, Resolution resolution) async {
    try {
      final candles = await _finnhubRestService.getCandles(
          symbol, resolution, fromDate.toUnixString(), toDate.toUnixString());
      if (candles.s == 'ok') {
        final maxPrice = candles.h.reduce(max);
        final minPrice = candles.l.reduce(min);
        final List<CandleChartData> list = [];
        final opens = candles.o;
        final closes = candles.c;
        final lows = candles.l;
        final highs = candles.h;

        for (int i = 0; i < opens.length; i++) {
          //TODO: Add other durations
          list.add(CandleChartData(fromDate.add(Duration(days: i)), opens[i], closes[i], highs[i], lows[i]));
        }

        return right(CandlesModel(list, symbol, maxPrice, minPrice));
      } else {
        throw 'No Data';
      }
    } catch (e) {
      return left(BasicFailure());
    }
  }


}
