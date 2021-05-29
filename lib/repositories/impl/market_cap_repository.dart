import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/models/daily_market_cap_model.dart';
import 'package:finboard_app/models/fair_market_cap_diff_model.dart';
import 'package:finboard_app/models/fair_market_cap_model.dart';
import 'package:finboard_app/models/mappers/daily_market_cap_mapper.dart';
import 'package:finboard_app/models/mappers/fair_market_cap_diff_mapper.dart';
import 'package:finboard_app/models/mappers/fair_market_cap_mapper.dart';
import 'package:finboard_app/models/mappers/market_cap_down_level_mapper.dart';
import 'package:finboard_app/models/market_cap_down_level_model.dart';
import 'package:finboard_app/repositories/contracts/market_cap_repository_contract.dart';
import 'package:finboard_app/services/datasource/back_rest_service.dart';

class MarketCapRepository implements MarketCapRepositoryContract {
  final BackRestService _backRestService;

  MarketCapRepository(this._backRestService);

  @override
  Future<Either<Failure, List<DailyMarketCapModel>>> getDailyMarketCap(
      String symbol) async {
    try {
      final result = await _backRestService.getDailyMarketCap(symbol);
      return right(DailyMarketCapMapper().mapTo(result));
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, List<MarketCapDownLevelModel>>> getMarketCapDownLevel(
      String symbol) async {
    try {
      final result = await _backRestService.getMarketCapDownLevel(symbol);
      return right(MarketCapDownLevelMapper().mapTo(result));
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, List<FairMarketCapDiffModel>>> getFairMarketCapDiff(
      String symbol) async {
    try {
      final result = await _backRestService.getFairMarketCapDiff(symbol);
      return right(FairMarketCapDiffMapper().mapTo(result));
    } catch (e) {
      return left(BasicFailure());
    }
  }

  @override
  Future<Either<Failure, List<FairMarketCapModel>>> getFairMarketCap(
      String symbol) async {
    try {
      final result = await _backRestService.getFairMarketCap(symbol);
      return right(FairMarketCapMapper().mapTo(result));
    } catch (e) {
      return left(BasicFailure());
    }
  }
}
