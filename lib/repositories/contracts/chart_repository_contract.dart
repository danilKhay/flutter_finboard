import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/models/aggregate_chart_data.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/column_chart_data.dart';
import 'package:finboard_app/models/res_sup_model.dart';
import 'package:finboard_app/models/resolution.dart';

abstract class ChartRepositoryContract {
  Future<Either<Failure, CandlesModel>> getCandleChartData(String symbol,
      DateTime fromDate, DateTime toDate, Resolution resolution);

  Future<Either<Failure, List<ColumnChartData>>> getColumnChartData(
      String symbol);

  Future<Either<Failure, List<AggregateChartData>>> getAggregateChartData(
      String symbol, Resolution resolution);

  Future<Either<Failure, ResAndSupModel>> getResAndSupData(String symbol,
      Resolution resolution);

}