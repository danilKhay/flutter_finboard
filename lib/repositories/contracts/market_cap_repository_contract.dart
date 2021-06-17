import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/models/daily_market_cap_model.dart';
import 'package:finboard_app/models/fair_market_cap_diff_model.dart';
import 'package:finboard_app/models/fair_market_cap_model.dart';
import 'package:finboard_app/models/market_cap_down_level_model.dart';

abstract class MarketCapRepositoryContract {

  Future<Either<Failure, List<DailyMarketCapModel>>> getDailyMarketCap(String symbol);

  Future<Either<Failure, List<FairMarketCapModel>>> getFairMarketCap(String symbol);

  Future<Either<Failure, List<FairMarketCapDiffModel>>> getFairMarketCapDiff(String symbol);

  Future<Either<Failure, List<MarketCapDownLevelModel>>> getMarketCapDownLevel(String symbol);
}