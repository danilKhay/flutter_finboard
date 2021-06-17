import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/models/candle_chart_data.dart';
import 'package:finboard_app/models/daily_market_cap_model.dart';
import 'package:finboard_app/models/fair_market_cap_diff_model.dart';
import 'package:finboard_app/models/fair_market_cap_model.dart';
import 'package:finboard_app/models/market_cap_down_level_model.dart';
import 'package:finboard_app/models/res_sup_model.dart';
import 'package:finboard_app/models/resolution.dart';
import 'package:finboard_app/repositories/contracts/chart_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/market_cap_repository_contract.dart';
import 'package:mobx/mobx.dart';

part 'main_chart_viewmodel.g.dart';

class MainChartViewModel = _MainChartViewModelBase with _$MainChartViewModel;

abstract class _MainChartViewModelBase with Store {
  final chartRepo = serviceLocator.get<ChartRepositoryContract>();
  final marketCapRepo = serviceLocator.get<MarketCapRepositoryContract>();

  CandlesModel candlesModel;

  List<DailyMarketCapModel> dailyMarketCap;

  List<FairMarketCapModel> fairMarketCap;

  List<FairMarketCapDiffModel> fairMarketCapDiff;

  List<MarketCapDownLevelModel> marketCapDownLevel;

  ResAndSupModel resAndSupModel;

  @observable
  MainChartState mainChartState = MainChartState.initial;

  @observable
  CandleState candleState = CandleState.hilo;

  @observable
  CandleInstruments candleInstruments = CandleInstruments.none;

  @observable
  MarketCapInstruments marketCapInstruments = MarketCapInstruments.none;


  @action
  Future getCandleData(String symbol) async {
    mainChartState = MainChartState.loading;
    if (candlesModel == null) {
      final today = DateTime.now();
      final yearAgo = today.subtract(Duration(days: 365));
      final result = await chartRepo.getCandleChartData(symbol, yearAgo, today, Resolution.DAY);
      result.fold((l) => mainChartState = MainChartState.error, (r) {
        candlesModel = r;
        mainChartState = MainChartState.candle;
      });
    } else {
      mainChartState = MainChartState.candle;
    }
  }

  @action
  Future getMarketCap(String symbol) async {
    mainChartState = MainChartState.loading;
    if (dailyMarketCap == null) {
      final result = await marketCapRepo.getDailyMarketCap(symbol);
      result.fold((l) => mainChartState = MainChartState.error, (r) {
        dailyMarketCap = r;
        mainChartState = MainChartState.marketCap;
      });
    } else {
      mainChartState = MainChartState.marketCap;
    }
  }

  @action
  Future getResAndSup(String symbol) async {
    if (candleInstruments != CandleInstruments.resAndSup) {
      candleInstruments = CandleInstruments.loading;
      if (resAndSupModel == null) {
        final result = await chartRepo.getResAndSupData(symbol, Resolution.DAY);
        result.fold((l) => mainChartState = MainChartState.error, (r) {
          resAndSupModel = r;
          candleInstruments = CandleInstruments.resAndSup;
        });
      } else {
        candleInstruments = CandleInstruments.resAndSup;
      }
    } else {
      candleInstruments = CandleInstruments.none;
    }

  }

  @action
  void changeChartType() {
    if (candleState == CandleState.hilo) {
      candleState = CandleState.candle;
    } else {
      if (candleState == CandleState.candle) {
        candleState = CandleState.hilo;
      }
    }
  }

  @action
  Future getFair(String symbol) async {
    if (marketCapInstruments != MarketCapInstruments.fair) {
      marketCapInstruments = MarketCapInstruments.loading;
      if (fairMarketCap == null) {
        final result = await marketCapRepo.getFairMarketCap(symbol);
        result.fold((l) => mainChartState = MainChartState.error, (r) {
          fairMarketCap = r;
          marketCapInstruments = MarketCapInstruments.fair;
        });
      } else {
        marketCapInstruments = MarketCapInstruments.fair;
      }
    } else {
      marketCapInstruments = MarketCapInstruments.none;
    }
  }

  @action
  Future getFairDiff(String symbol) async {
    if (marketCapInstruments != MarketCapInstruments.fairDiff) {
      marketCapInstruments = MarketCapInstruments.loading;
      if (fairMarketCapDiff == null) {
        final result = await marketCapRepo.getFairMarketCapDiff(symbol);
        result.fold((l) => mainChartState = MainChartState.error, (r) {
          fairMarketCapDiff = r;
          marketCapInstruments = MarketCapInstruments.fairDiff;
        });
      } else {
        marketCapInstruments = MarketCapInstruments.fairDiff;
      }
    } else {
      marketCapInstruments = MarketCapInstruments.none;
    }
  }

  @action
  Future getDownLevel(String symbol) async {
    if (marketCapInstruments != MarketCapInstruments.downLevel) {
      marketCapInstruments = MarketCapInstruments.loading;
      if (marketCapDownLevel == null) {
        final result = await marketCapRepo.getMarketCapDownLevel(symbol);
        result.fold((l) => mainChartState = MainChartState.error, (r) {
          marketCapDownLevel = r;
          marketCapInstruments = MarketCapInstruments.downLevel;
        });
      } else {
        marketCapInstruments = MarketCapInstruments.downLevel;
      }
    } else {
      marketCapInstruments = MarketCapInstruments.none;
    }
  }

  @action
  Future refresh(String symbol) async {
    mainChartState = MainChartState.loading;
    candleInstruments = CandleInstruments.none;
    marketCapInstruments = MarketCapInstruments.none;
    candleState = CandleState.hilo;
    candlesModel = null;
    dailyMarketCap = null;
    fairMarketCap = null;
    fairMarketCapDiff = null;
    marketCapDownLevel = null;
    resAndSupModel = null;
    await getCandleData(symbol);
  }

}

enum MainChartState {
  initial,
  loading,
  candle,
  marketCap,
  error
}

enum CandleState {
  candle,
  hilo
}

enum CandleInstruments {
  none,
  loading,
  resAndSup
}

enum MarketCapInstruments {
  none,
  loading,
  fair,
  fairDiff,
  downLevel
}