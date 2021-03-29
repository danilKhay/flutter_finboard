/// metric : {"10DayAverageTradingVolume":111.55962,"13WeekPriceReturnDaily":-8.15337,"26WeekPriceReturnDaily":7.95333,"3MonthAverageTradingVolume":2294.0107,"52WeekHigh":145.09,"52WeekHighDate":"2021-01-25","52WeekLow":59.225,"52WeekLowDate":"2020-04-02","52WeekPriceReturnDaily":87.60254,"5DayPriceReturnDaily":1.01675,"assetTurnoverAnnual":0.82884,"assetTurnoverTTM":0.84683,"beta":1.21687,"bookValuePerShareAnnual":3.84873,"bookValuePerShareQuarterly":3.93645,"bookValueShareGrowth5Y":-6.37004,"capitalSpendingGrowth5Y":-8.64702,"cashFlowPerShareAnnual":3.9061,"cashFlowPerShareTTM":4.31281,"cashPerSharePerShareAnnual":5.35691,"cashPerSharePerShareQuarterly":4.56665,"currentDividendYieldTTM":0.6662,"currentEv/freeCashFlowAnnual":43.6952,"currentEv/freeCashFlowTTM":39.82574,"currentRatioAnnual":1.3636,"currentRatioQuarterly":1.163,"dividendGrowthRate5Y":9.83445,"dividendPerShare5Y":0.674,"dividendPerShareAnnual":0.795,"dividendYield5Y":1.16156,"dividendYieldIndicatedAnnual":0.67651,"dividendsPerShareTTM":0.8075,"ebitdPerShareTTM":4.90773,"ebitdaCagr5Y":-1.0971,"ebitdaInterimCagr5Y":0.56561,"epsBasicExclExtraItemsAnnual":3.30859,"epsBasicExclExtraItemsTTM":3.73824,"epsExclExtraItemsAnnual":3.27535,"epsExclExtraItemsTTM":3.6991,"epsGrowth3Y":12.47869,"epsGrowth5Y":7.28691,"epsGrowthQuarterlyYoy":34.64245,"epsGrowthTTMYoy":16.86043,"epsInclExtraItemsAnnual":3.27535,"epsInclExtraItemsTTM":3.6991,"epsNormalizedAnnual":3.27535,"focfCagr5Y":0.3639,"freeCashFlowAnnual":59284,"freeCashFlowPerShareTTM":3.80728,"freeCashFlowTTM":66064,"freeOperatingCashFlow/revenue5Y":18.85883,"freeOperatingCashFlow/revenueTTM":22.46043,"grossMargin5Y":38.3595,"grossMarginAnnual":38.23325,"grossMarginTTM":38.78049,"inventoryTurnoverAnnual":41.52296,"inventoryTurnoverTTM":39.70628,"longTermDebt/equityAnnual":151.9827,"longTermDebt/equityQuarterly":149.9169,"marketCapitalization":2034885,"monthToDatePriceReturnDaily":-0.04123,"netDebtAnnual":22154,"netDebtInterim":35217,"netIncomeEmployeeAnnual":404302.8,"netIncomeEmployeeTTM":434898,"netInterestCoverageAnnual":null,"netInterestCoverageTTM":null,"netMarginGrowth5Y":-1.75179,"netProfitMargin5Y":21.50219,"netProfitMarginAnnual":20.91361,"netProfitMarginTTM":21.73492,"operatingMargin5Y":25.89906,"operatingMarginAnnual":24.14731,"operatingMarginTTM":25.24453,"payoutRatioAnnual":24.53711,"payoutRatioTTM":22.13202,"pbAnnual":31.49349,"pbQuarterly":30.79167,"pcfShareTTM":27.19126,"peBasicExclExtraTTM":35.30271,"peExclExtraAnnual":37.00673,"peExclExtraHighTTM":35.67625,"peExclExtraTTM":32.76743,"peExclLowTTM":10.90841,"peInclExtraTTM":32.76743,"peNormalizedAnnual":37.00673,"pfcfShareAnnual":34.32436,"pfcfShareTTM":30.80172,"pretaxMargin5Y":26.59841,"pretaxMarginAnnual":24.43983,"pretaxMarginTTM":25.41418,"priceRelativeToS&P50013Week":-14.42693,"priceRelativeToS&P50026Week":-10.40982,"priceRelativeToS&P5004Week":-4.15045,"priceRelativeToS&P50052Week":24.14212,"priceRelativeToS&P500Ytd":-13.67292,"psAnnual":7.41266,"psTTM":6.9182,"ptbvAnnual":31.1435,"ptbvQuarterly":30.72731,"quickRatioAnnual":1.32507,"quickRatioQuarterly":1.12547,"receivablesTurnoverAnnual":14.06111,"receivablesTurnoverTTM":12.23752,"revenueEmployeeAnnual":1933204,"revenueEmployeeTTM":2000918,"revenueGrowth3Y":6.19294,"revenueGrowth5Y":3.27041,"revenueGrowthQuarterlyYoy":21.36813,"revenueGrowthTTMYoy":9.88184,"revenuePerShareAnnual":15.66132,"revenuePerShareTTM":16.95104,"revenueShareGrowth5Y":9.19987,"roaRfy":17.33413,"roaa5Y":15.67208,"roae5Y":48.47848,"roaeTTM":82.09046,"roeRfy":73.68556,"roeTTM":18.40581,"roi5Y":22.05595,"roiAnnual":25.44284,"roiTTM":27.79541,"tangibleBookValuePerShareAnnual":3.84873,"tangibleBookValuePerShareQuarterly":3.93645,"tbvCagr5Y":-9.95011,"totalDebt/totalEquityAnnual":173.0926,"totalDebt/totalEquityQuarterly":169.1879,"totalDebtCagr5Y":11.94642,"yearToDatePriceReturnDaily":-8.65174}
/// metricType : "all"
/// symbol : "AAPL"

class BasicFinancials {
  Metric _metric;
  String _metricType;
  String _symbol;

  Metric get metric => _metric;
  String get metricType => _metricType;
  String get symbol => _symbol;

  BasicFinancials({
      Metric metric, 
      String metricType, 
      String symbol}){
    _metric = metric;
    _metricType = metricType;
    _symbol = symbol;
}

  BasicFinancials.fromJson(dynamic json) {
    _metric = json["metric"] != null ? Metric.fromJson(json["metric"]) : null;
    _metricType = json["metricType"];
    _symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_metric != null) {
      map["metric"] = _metric.toJson();
    }
    map["metricType"] = _metricType;
    map["symbol"] = _symbol;
    return map;
  }

}

/// 10DayAverageTradingVolume : 111.55962
/// 13WeekPriceReturnDaily : -8.15337
/// 26WeekPriceReturnDaily : 7.95333
/// 3MonthAverageTradingVolume : 2294.0107
/// 52WeekHigh : 145.09
/// 52WeekHighDate : "2021-01-25"
/// 52WeekLow : 59.225
/// 52WeekLowDate : "2020-04-02"
/// 52WeekPriceReturnDaily : 87.60254
/// 5DayPriceReturnDaily : 1.01675
/// assetTurnoverAnnual : 0.82884
/// assetTurnoverTTM : 0.84683
/// beta : 1.21687
/// bookValuePerShareAnnual : 3.84873
/// bookValuePerShareQuarterly : 3.93645
/// bookValueShareGrowth5Y : -6.37004
/// capitalSpendingGrowth5Y : -8.64702
/// cashFlowPerShareAnnual : 3.9061
/// cashFlowPerShareTTM : 4.31281
/// cashPerSharePerShareAnnual : 5.35691
/// cashPerSharePerShareQuarterly : 4.56665
/// currentDividendYieldTTM : 0.6662
/// currentEv/freeCashFlowAnnual : 43.6952
/// currentEv/freeCashFlowTTM : 39.82574
/// currentRatioAnnual : 1.3636
/// currentRatioQuarterly : 1.163
/// dividendGrowthRate5Y : 9.83445
/// dividendPerShare5Y : 0.674
/// dividendPerShareAnnual : 0.795
/// dividendYield5Y : 1.16156
/// dividendYieldIndicatedAnnual : 0.67651
/// dividendsPerShareTTM : 0.8075
/// ebitdPerShareTTM : 4.90773
/// ebitdaCagr5Y : -1.0971
/// ebitdaInterimCagr5Y : 0.56561
/// epsBasicExclExtraItemsAnnual : 3.30859
/// epsBasicExclExtraItemsTTM : 3.73824
/// epsExclExtraItemsAnnual : 3.27535
/// epsExclExtraItemsTTM : 3.6991
/// epsGrowth3Y : 12.47869
/// epsGrowth5Y : 7.28691
/// epsGrowthQuarterlyYoy : 34.64245
/// epsGrowthTTMYoy : 16.86043
/// epsInclExtraItemsAnnual : 3.27535
/// epsInclExtraItemsTTM : 3.6991
/// epsNormalizedAnnual : 3.27535
/// focfCagr5Y : 0.3639
/// freeCashFlowAnnual : 59284
/// freeCashFlowPerShareTTM : 3.80728
/// freeCashFlowTTM : 66064
/// freeOperatingCashFlow/revenue5Y : 18.85883
/// freeOperatingCashFlow/revenueTTM : 22.46043
/// grossMargin5Y : 38.3595
/// grossMarginAnnual : 38.23325
/// grossMarginTTM : 38.78049
/// inventoryTurnoverAnnual : 41.52296
/// inventoryTurnoverTTM : 39.70628
/// longTermDebt/equityAnnual : 151.9827
/// longTermDebt/equityQuarterly : 149.9169
/// marketCapitalization : 2034885
/// monthToDatePriceReturnDaily : -0.04123
/// netDebtAnnual : 22154
/// netDebtInterim : 35217
/// netIncomeEmployeeAnnual : 404302.8
/// netIncomeEmployeeTTM : 434898
/// netInterestCoverageAnnual : null
/// netInterestCoverageTTM : null
/// netMarginGrowth5Y : -1.75179
/// netProfitMargin5Y : 21.50219
/// netProfitMarginAnnual : 20.91361
/// netProfitMarginTTM : 21.73492
/// operatingMargin5Y : 25.89906
/// operatingMarginAnnual : 24.14731
/// operatingMarginTTM : 25.24453
/// payoutRatioAnnual : 24.53711
/// payoutRatioTTM : 22.13202
/// pbAnnual : 31.49349
/// pbQuarterly : 30.79167
/// pcfShareTTM : 27.19126
/// peBasicExclExtraTTM : 35.30271
/// peExclExtraAnnual : 37.00673
/// peExclExtraHighTTM : 35.67625
/// peExclExtraTTM : 32.76743
/// peExclLowTTM : 10.90841
/// peInclExtraTTM : 32.76743
/// peNormalizedAnnual : 37.00673
/// pfcfShareAnnual : 34.32436
/// pfcfShareTTM : 30.80172
/// pretaxMargin5Y : 26.59841
/// pretaxMarginAnnual : 24.43983
/// pretaxMarginTTM : 25.41418
/// priceRelativeToS&P50013Week : -14.42693
/// priceRelativeToS&P50026Week : -10.40982
/// priceRelativeToS&P5004Week : -4.15045
/// priceRelativeToS&P50052Week : 24.14212
/// priceRelativeToS&P500Ytd : -13.67292
/// psAnnual : 7.41266
/// psTTM : 6.9182
/// ptbvAnnual : 31.1435
/// ptbvQuarterly : 30.72731
/// quickRatioAnnual : 1.32507
/// quickRatioQuarterly : 1.12547
/// receivablesTurnoverAnnual : 14.06111
/// receivablesTurnoverTTM : 12.23752
/// revenueEmployeeAnnual : 1933204
/// revenueEmployeeTTM : 2000918
/// revenueGrowth3Y : 6.19294
/// revenueGrowth5Y : 3.27041
/// revenueGrowthQuarterlyYoy : 21.36813
/// revenueGrowthTTMYoy : 9.88184
/// revenuePerShareAnnual : 15.66132
/// revenuePerShareTTM : 16.95104
/// revenueShareGrowth5Y : 9.19987
/// roaRfy : 17.33413
/// roaa5Y : 15.67208
/// roae5Y : 48.47848
/// roaeTTM : 82.09046
/// roeRfy : 73.68556
/// roeTTM : 18.40581
/// roi5Y : 22.05595
/// roiAnnual : 25.44284
/// roiTTM : 27.79541
/// tangibleBookValuePerShareAnnual : 3.84873
/// tangibleBookValuePerShareQuarterly : 3.93645
/// tbvCagr5Y : -9.95011
/// totalDebt/totalEquityAnnual : 173.0926
/// totalDebt/totalEquityQuarterly : 169.1879
/// totalDebtCagr5Y : 11.94642
/// yearToDatePriceReturnDaily : -8.65174

class Metric {
  double _10DayAverageTradingVolume;
  double _13WeekPriceReturnDaily;
  double _26WeekPriceReturnDaily;
  double _3MonthAverageTradingVolume;
  double _52WeekHigh;
  String _52WeekHighDate;
  double _52WeekLow;
  String _52WeekLowDate;
  double _52WeekPriceReturnDaily;
  double _5DayPriceReturnDaily;
  double _assetTurnoverAnnual;
  double _assetTurnoverTTM;
  double _beta;
  double _bookValuePerShareAnnual;
  double _bookValuePerShareQuarterly;
  double _bookValueShareGrowth5Y;
  double _capitalSpendingGrowth5Y;
  double _cashFlowPerShareAnnual;
  double _cashFlowPerShareTTM;
  double _cashPerSharePerShareAnnual;
  double _cashPerSharePerShareQuarterly;
  double _currentDividendYieldTTM;
  double _currentEvFreeCashFlowAnnual;
  double _currentEvFreeCashFlowTTM;
  double _currentRatioAnnual;
  double _currentRatioQuarterly;
  double _dividendGrowthRate5Y;
  double _dividendPerShare5Y;
  double _dividendPerShareAnnual;
  double _dividendYield5Y;
  double _dividendYieldIndicatedAnnual;
  double _dividendsPerShareTTM;
  double _ebitdPerShareTTM;
  double _ebitdaCagr5Y;
  double _ebitdaInterimCagr5Y;
  double _epsBasicExclExtraItemsAnnual;
  double _epsBasicExclExtraItemsTTM;
  double _epsExclExtraItemsAnnual;
  double _epsExclExtraItemsTTM;
  double _epsGrowth3Y;
  double _epsGrowth5Y;
  double _epsGrowthQuarterlyYoy;
  double _epsGrowthTTMYoy;
  double _epsInclExtraItemsAnnual;
  double _epsInclExtraItemsTTM;
  double _epsNormalizedAnnual;
  double _focfCagr5Y;
  int _freeCashFlowAnnual;
  double _freeCashFlowPerShareTTM;
  int _freeCashFlowTTM;
  double _freeOperatingCashFlowRevenue5Y;
  double _freeOperatingCashFlowRevenueTTM;
  double _grossMargin5Y;
  double _grossMarginAnnual;
  double _grossMarginTTM;
  double _inventoryTurnoverAnnual;
  double _inventoryTurnoverTTM;
  double _longTermDebtEquityAnnual;
  double _longTermDebtEquityQuarterly;
  int _marketCapitalization;
  double _monthToDatePriceReturnDaily;
  int _netDebtAnnual;
  int _netDebtInterim;
  double _netIncomeEmployeeAnnual;
  int _netIncomeEmployeeTTM;
  dynamic _netInterestCoverageAnnual;
  dynamic _netInterestCoverageTTM;
  double _netMarginGrowth5Y;
  double _netProfitMargin5Y;
  double _netProfitMarginAnnual;
  double _netProfitMarginTTM;
  double _operatingMargin5Y;
  double _operatingMarginAnnual;
  double _operatingMarginTTM;
  double _payoutRatioAnnual;
  double _payoutRatioTTM;
  double _pbAnnual;
  double _pbQuarterly;
  double _pcfShareTTM;
  double _peBasicExclExtraTTM;
  double _peExclExtraAnnual;
  double _peExclExtraHighTTM;
  double _peExclExtraTTM;
  double _peExclLowTTM;
  double _peInclExtraTTM;
  double _peNormalizedAnnual;
  double _pfcfShareAnnual;
  double _pfcfShareTTM;
  double _pretaxMargin5Y;
  double _pretaxMarginAnnual;
  double _pretaxMarginTTM;
  double _priceRelativeToSP50013Week;
  double _priceRelativeToSP50026Week;
  double _priceRelativeToSP5004Week;
  double _priceRelativeToSP50052Week;
  double _priceRelativeToSP500Ytd;
  double _psAnnual;
  double _psTTM;
  double _ptbvAnnual;
  double _ptbvQuarterly;
  double _quickRatioAnnual;
  double _quickRatioQuarterly;
  double _receivablesTurnoverAnnual;
  double _receivablesTurnoverTTM;
  int _revenueEmployeeAnnual;
  int _revenueEmployeeTTM;
  double _revenueGrowth3Y;
  double _revenueGrowth5Y;
  double _revenueGrowthQuarterlyYoy;
  double _revenueGrowthTTMYoy;
  double _revenuePerShareAnnual;
  double _revenuePerShareTTM;
  double _revenueShareGrowth5Y;
  double _roaRfy;
  double _roaa5Y;
  double _roae5Y;
  double _roaeTTM;
  double _roeRfy;
  double _roeTTM;
  double _roi5Y;
  double _roiAnnual;
  double _roiTTM;
  double _tangibleBookValuePerShareAnnual;
  double _tangibleBookValuePerShareQuarterly;
  double _tbvCagr5Y;
  double _totalDebtTotalEquityAnnual;
  double _totalDebtTotalEquityQuarterly;
  double _totalDebtCagr5Y;
  double _yearToDatePriceReturnDaily;

  double get q10DayAverageTradingVolume => _10DayAverageTradingVolume;
  double get q13WeekPriceReturnDaily => _13WeekPriceReturnDaily;
  double get q26WeekPriceReturnDaily => _26WeekPriceReturnDaily;
  double get q3MonthAverageTradingVolume => _3MonthAverageTradingVolume;
  double get q52WeekHigh => _52WeekHigh;
  String get q52WeekHighDate => _52WeekHighDate;
  double get q52WeekLow => _52WeekLow;
  String get q52WeekLowDate => _52WeekLowDate;
  double get q52WeekPriceReturnDaily => _52WeekPriceReturnDaily;
  double get q5DayPriceReturnDaily => _5DayPriceReturnDaily;
  double get assetTurnoverAnnual => _assetTurnoverAnnual;
  double get assetTurnoverTTM => _assetTurnoverTTM;
  double get beta => _beta;
  double get bookValuePerShareAnnual => _bookValuePerShareAnnual;
  double get bookValuePerShareQuarterly => _bookValuePerShareQuarterly;
  double get bookValueShareGrowth5Y => _bookValueShareGrowth5Y;
  double get capitalSpendingGrowth5Y => _capitalSpendingGrowth5Y;
  double get cashFlowPerShareAnnual => _cashFlowPerShareAnnual;
  double get cashFlowPerShareTTM => _cashFlowPerShareTTM;
  double get cashPerSharePerShareAnnual => _cashPerSharePerShareAnnual;
  double get cashPerSharePerShareQuarterly => _cashPerSharePerShareQuarterly;
  double get currentDividendYieldTTM => _currentDividendYieldTTM;
  double get currentEvFreeCashFlowAnnual => _currentEvFreeCashFlowAnnual;
  double get currentEvFreeCashFlowTTM => _currentEvFreeCashFlowTTM;
  double get currentRatioAnnual => _currentRatioAnnual;
  double get currentRatioQuarterly => _currentRatioQuarterly;
  double get dividendGrowthRate5Y => _dividendGrowthRate5Y;
  double get dividendPerShare5Y => _dividendPerShare5Y;
  double get dividendPerShareAnnual => _dividendPerShareAnnual;
  double get dividendYield5Y => _dividendYield5Y;
  double get dividendYieldIndicatedAnnual => _dividendYieldIndicatedAnnual;
  double get dividendsPerShareTTM => _dividendsPerShareTTM;
  double get ebitdPerShareTTM => _ebitdPerShareTTM;
  double get ebitdaCagr5Y => _ebitdaCagr5Y;
  double get ebitdaInterimCagr5Y => _ebitdaInterimCagr5Y;
  double get epsBasicExclExtraItemsAnnual => _epsBasicExclExtraItemsAnnual;
  double get epsBasicExclExtraItemsTTM => _epsBasicExclExtraItemsTTM;
  double get epsExclExtraItemsAnnual => _epsExclExtraItemsAnnual;
  double get epsExclExtraItemsTTM => _epsExclExtraItemsTTM;
  double get epsGrowth3Y => _epsGrowth3Y;
  double get epsGrowth5Y => _epsGrowth5Y;
  double get epsGrowthQuarterlyYoy => _epsGrowthQuarterlyYoy;
  double get epsGrowthTTMYoy => _epsGrowthTTMYoy;
  double get epsInclExtraItemsAnnual => _epsInclExtraItemsAnnual;
  double get epsInclExtraItemsTTM => _epsInclExtraItemsTTM;
  double get epsNormalizedAnnual => _epsNormalizedAnnual;
  double get focfCagr5Y => _focfCagr5Y;
  int get freeCashFlowAnnual => _freeCashFlowAnnual;
  double get freeCashFlowPerShareTTM => _freeCashFlowPerShareTTM;
  int get freeCashFlowTTM => _freeCashFlowTTM;
  double get freeOperatingCashFlowRevenue5Y => _freeOperatingCashFlowRevenue5Y;
  double get freeOperatingCashFlowRevenueTTM => _freeOperatingCashFlowRevenueTTM;
  double get grossMargin5Y => _grossMargin5Y;
  double get grossMarginAnnual => _grossMarginAnnual;
  double get grossMarginTTM => _grossMarginTTM;
  double get inventoryTurnoverAnnual => _inventoryTurnoverAnnual;
  double get inventoryTurnoverTTM => _inventoryTurnoverTTM;
  double get longTermDebtEquityAnnual => _longTermDebtEquityAnnual;
  double get longTermDebtEquityQuarterly => _longTermDebtEquityQuarterly;
  int get marketCapitalization => _marketCapitalization;
  double get monthToDatePriceReturnDaily => _monthToDatePriceReturnDaily;
  int get netDebtAnnual => _netDebtAnnual;
  int get netDebtInterim => _netDebtInterim;
  double get netIncomeEmployeeAnnual => _netIncomeEmployeeAnnual;
  int get netIncomeEmployeeTTM => _netIncomeEmployeeTTM;
  dynamic get netInterestCoverageAnnual => _netInterestCoverageAnnual;
  dynamic get netInterestCoverageTTM => _netInterestCoverageTTM;
  double get netMarginGrowth5Y => _netMarginGrowth5Y;
  double get netProfitMargin5Y => _netProfitMargin5Y;
  double get netProfitMarginAnnual => _netProfitMarginAnnual;
  double get netProfitMarginTTM => _netProfitMarginTTM;
  double get operatingMargin5Y => _operatingMargin5Y;
  double get operatingMarginAnnual => _operatingMarginAnnual;
  double get operatingMarginTTM => _operatingMarginTTM;
  double get payoutRatioAnnual => _payoutRatioAnnual;
  double get payoutRatioTTM => _payoutRatioTTM;
  double get pbAnnual => _pbAnnual;
  double get pbQuarterly => _pbQuarterly;
  double get pcfShareTTM => _pcfShareTTM;
  double get peBasicExclExtraTTM => _peBasicExclExtraTTM;
  double get peExclExtraAnnual => _peExclExtraAnnual;
  double get peExclExtraHighTTM => _peExclExtraHighTTM;
  double get peExclExtraTTM => _peExclExtraTTM;
  double get peExclLowTTM => _peExclLowTTM;
  double get peInclExtraTTM => _peInclExtraTTM;
  double get peNormalizedAnnual => _peNormalizedAnnual;
  double get pfcfShareAnnual => _pfcfShareAnnual;
  double get pfcfShareTTM => _pfcfShareTTM;
  double get pretaxMargin5Y => _pretaxMargin5Y;
  double get pretaxMarginAnnual => _pretaxMarginAnnual;
  double get pretaxMarginTTM => _pretaxMarginTTM;
  double get priceRelativeToSP50013Week => _priceRelativeToSP50013Week;
  double get priceRelativeToSP50026Week => _priceRelativeToSP50026Week;
  double get priceRelativeToSP5004Week => _priceRelativeToSP5004Week;
  double get priceRelativeToSP50052Week => _priceRelativeToSP50052Week;
  double get priceRelativeToSP500Ytd => _priceRelativeToSP500Ytd;
  double get psAnnual => _psAnnual;
  double get psTTM => _psTTM;
  double get ptbvAnnual => _ptbvAnnual;
  double get ptbvQuarterly => _ptbvQuarterly;
  double get quickRatioAnnual => _quickRatioAnnual;
  double get quickRatioQuarterly => _quickRatioQuarterly;
  double get receivablesTurnoverAnnual => _receivablesTurnoverAnnual;
  double get receivablesTurnoverTTM => _receivablesTurnoverTTM;
  int get revenueEmployeeAnnual => _revenueEmployeeAnnual;
  int get revenueEmployeeTTM => _revenueEmployeeTTM;
  double get revenueGrowth3Y => _revenueGrowth3Y;
  double get revenueGrowth5Y => _revenueGrowth5Y;
  double get revenueGrowthQuarterlyYoy => _revenueGrowthQuarterlyYoy;
  double get revenueGrowthTTMYoy => _revenueGrowthTTMYoy;
  double get revenuePerShareAnnual => _revenuePerShareAnnual;
  double get revenuePerShareTTM => _revenuePerShareTTM;
  double get revenueShareGrowth5Y => _revenueShareGrowth5Y;
  double get roaRfy => _roaRfy;
  double get roaa5Y => _roaa5Y;
  double get roae5Y => _roae5Y;
  double get roaeTTM => _roaeTTM;
  double get roeRfy => _roeRfy;
  double get roeTTM => _roeTTM;
  double get roi5Y => _roi5Y;
  double get roiAnnual => _roiAnnual;
  double get roiTTM => _roiTTM;
  double get tangibleBookValuePerShareAnnual => _tangibleBookValuePerShareAnnual;
  double get tangibleBookValuePerShareQuarterly => _tangibleBookValuePerShareQuarterly;
  double get tbvCagr5Y => _tbvCagr5Y;
  double get totalDebtTotalEquityAnnual => _totalDebtTotalEquityAnnual;
  double get totalDebtTotalEquityQuarterly => _totalDebtTotalEquityQuarterly;
  double get totalDebtCagr5Y => _totalDebtCagr5Y;
  double get yearToDatePriceReturnDaily => _yearToDatePriceReturnDaily;

  Metric({
      double q10DayAverageTradingVolume,
      double q13WeekPriceReturnDaily,
      double q26WeekPriceReturnDaily,
      double q3MonthAverageTradingVolume,
      double q52WeekHigh,
      String q52WeekHighDate,
      double q52WeekLow,
      String q52WeekLowDate,
      double q52WeekPriceReturnDaily,
      double q5DayPriceReturnDaily,
      double assetTurnoverAnnual, 
      double assetTurnoverTTM, 
      double beta, 
      double bookValuePerShareAnnual, 
      double bookValuePerShareQuarterly, 
      double bookValueShareGrowth5Y, 
      double capitalSpendingGrowth5Y, 
      double cashFlowPerShareAnnual, 
      double cashFlowPerShareTTM, 
      double cashPerSharePerShareAnnual, 
      double cashPerSharePerShareQuarterly, 
      double currentDividendYieldTTM, 
      double currentEvFreeCashFlowAnnual,
      double currentEvFreeCashFlowTTM,
      double currentRatioAnnual, 
      double currentRatioQuarterly, 
      double dividendGrowthRate5Y, 
      double dividendPerShare5Y, 
      double dividendPerShareAnnual, 
      double dividendYield5Y, 
      double dividendYieldIndicatedAnnual, 
      double dividendsPerShareTTM, 
      double ebitdPerShareTTM, 
      double ebitdaCagr5Y, 
      double ebitdaInterimCagr5Y, 
      double epsBasicExclExtraItemsAnnual, 
      double epsBasicExclExtraItemsTTM, 
      double epsExclExtraItemsAnnual, 
      double epsExclExtraItemsTTM, 
      double epsGrowth3Y, 
      double epsGrowth5Y, 
      double epsGrowthQuarterlyYoy, 
      double epsGrowthTTMYoy, 
      double epsInclExtraItemsAnnual, 
      double epsInclExtraItemsTTM, 
      double epsNormalizedAnnual, 
      double focfCagr5Y, 
      int freeCashFlowAnnual, 
      double freeCashFlowPerShareTTM, 
      int freeCashFlowTTM, 
      double freeOperatingCashFlowRevenue5Y,
      double freeOperatingCashFlowRevenueTTM,
      double grossMargin5Y, 
      double grossMarginAnnual, 
      double grossMarginTTM, 
      double inventoryTurnoverAnnual, 
      double inventoryTurnoverTTM, 
      double longTermDebtEquityAnnual,
      double longTermDebtEquityQuarterly,
      int marketCapitalization, 
      double monthToDatePriceReturnDaily, 
      int netDebtAnnual, 
      int netDebtInterim, 
      double netIncomeEmployeeAnnual, 
      int netIncomeEmployeeTTM, 
      dynamic netInterestCoverageAnnual, 
      dynamic netInterestCoverageTTM, 
      double netMarginGrowth5Y, 
      double netProfitMargin5Y, 
      double netProfitMarginAnnual, 
      double netProfitMarginTTM, 
      double operatingMargin5Y, 
      double operatingMarginAnnual, 
      double operatingMarginTTM, 
      double payoutRatioAnnual, 
      double payoutRatioTTM, 
      double pbAnnual, 
      double pbQuarterly, 
      double pcfShareTTM, 
      double peBasicExclExtraTTM, 
      double peExclExtraAnnual, 
      double peExclExtraHighTTM, 
      double peExclExtraTTM, 
      double peExclLowTTM, 
      double peInclExtraTTM, 
      double peNormalizedAnnual, 
      double pfcfShareAnnual, 
      double pfcfShareTTM, 
      double pretaxMargin5Y, 
      double pretaxMarginAnnual, 
      double pretaxMarginTTM, 
      double priceRelativeToSP50013Week,
      double priceRelativeToSP50026Week,
      double priceRelativeToSP5004Week,
      double priceRelativeToSP50052Week,
      double priceRelativeToSP500Ytd,
      double psAnnual, 
      double psTTM, 
      double ptbvAnnual, 
      double ptbvQuarterly, 
      double quickRatioAnnual, 
      double quickRatioQuarterly, 
      double receivablesTurnoverAnnual, 
      double receivablesTurnoverTTM, 
      int revenueEmployeeAnnual, 
      int revenueEmployeeTTM, 
      double revenueGrowth3Y, 
      double revenueGrowth5Y, 
      double revenueGrowthQuarterlyYoy, 
      double revenueGrowthTTMYoy, 
      double revenuePerShareAnnual, 
      double revenuePerShareTTM, 
      double revenueShareGrowth5Y, 
      double roaRfy, 
      double roaa5Y, 
      double roae5Y, 
      double roaeTTM, 
      double roeRfy, 
      double roeTTM, 
      double roi5Y, 
      double roiAnnual, 
      double roiTTM, 
      double tangibleBookValuePerShareAnnual, 
      double tangibleBookValuePerShareQuarterly, 
      double tbvCagr5Y, 
      double totalDebtTotalEquityAnnual,
      double totalDebtTotalEquityQuarterly,
      double totalDebtCagr5Y, 
      double yearToDatePriceReturnDaily}){
    _10DayAverageTradingVolume = q10DayAverageTradingVolume;
    _13WeekPriceReturnDaily = q13WeekPriceReturnDaily;
    _26WeekPriceReturnDaily = q26WeekPriceReturnDaily;
    _3MonthAverageTradingVolume = q3MonthAverageTradingVolume;
    _52WeekHigh = q52WeekHigh;
    _52WeekHighDate = q52WeekHighDate;
    _52WeekLow = q52WeekLow;
    _52WeekLowDate = q52WeekLowDate;
    _52WeekPriceReturnDaily = q52WeekPriceReturnDaily;
    _5DayPriceReturnDaily = q5DayPriceReturnDaily;
    _assetTurnoverAnnual = assetTurnoverAnnual;
    _assetTurnoverTTM = assetTurnoverTTM;
    _beta = beta;
    _bookValuePerShareAnnual = bookValuePerShareAnnual;
    _bookValuePerShareQuarterly = bookValuePerShareQuarterly;
    _bookValueShareGrowth5Y = bookValueShareGrowth5Y;
    _capitalSpendingGrowth5Y = capitalSpendingGrowth5Y;
    _cashFlowPerShareAnnual = cashFlowPerShareAnnual;
    _cashFlowPerShareTTM = cashFlowPerShareTTM;
    _cashPerSharePerShareAnnual = cashPerSharePerShareAnnual;
    _cashPerSharePerShareQuarterly = cashPerSharePerShareQuarterly;
    _currentDividendYieldTTM = currentDividendYieldTTM;
    _currentEvFreeCashFlowAnnual = currentEvFreeCashFlowAnnual;
    _currentEvFreeCashFlowTTM = currentEvFreeCashFlowTTM;
    _currentRatioAnnual = currentRatioAnnual;
    _currentRatioQuarterly = currentRatioQuarterly;
    _dividendGrowthRate5Y = dividendGrowthRate5Y;
    _dividendPerShare5Y = dividendPerShare5Y;
    _dividendPerShareAnnual = dividendPerShareAnnual;
    _dividendYield5Y = dividendYield5Y;
    _dividendYieldIndicatedAnnual = dividendYieldIndicatedAnnual;
    _dividendsPerShareTTM = dividendsPerShareTTM;
    _ebitdPerShareTTM = ebitdPerShareTTM;
    _ebitdaCagr5Y = ebitdaCagr5Y;
    _ebitdaInterimCagr5Y = ebitdaInterimCagr5Y;
    _epsBasicExclExtraItemsAnnual = epsBasicExclExtraItemsAnnual;
    _epsBasicExclExtraItemsTTM = epsBasicExclExtraItemsTTM;
    _epsExclExtraItemsAnnual = epsExclExtraItemsAnnual;
    _epsExclExtraItemsTTM = epsExclExtraItemsTTM;
    _epsGrowth3Y = epsGrowth3Y;
    _epsGrowth5Y = epsGrowth5Y;
    _epsGrowthQuarterlyYoy = epsGrowthQuarterlyYoy;
    _epsGrowthTTMYoy = epsGrowthTTMYoy;
    _epsInclExtraItemsAnnual = epsInclExtraItemsAnnual;
    _epsInclExtraItemsTTM = epsInclExtraItemsTTM;
    _epsNormalizedAnnual = epsNormalizedAnnual;
    _focfCagr5Y = focfCagr5Y;
    _freeCashFlowAnnual = freeCashFlowAnnual;
    _freeCashFlowPerShareTTM = freeCashFlowPerShareTTM;
    _freeCashFlowTTM = freeCashFlowTTM;
    _freeOperatingCashFlowRevenue5Y = freeOperatingCashFlowRevenue5Y;
    _freeOperatingCashFlowRevenueTTM = freeOperatingCashFlowRevenueTTM;
    _grossMargin5Y = grossMargin5Y;
    _grossMarginAnnual = grossMarginAnnual;
    _grossMarginTTM = grossMarginTTM;
    _inventoryTurnoverAnnual = inventoryTurnoverAnnual;
    _inventoryTurnoverTTM = inventoryTurnoverTTM;
    _longTermDebtEquityAnnual = longTermDebtEquityAnnual;
    _longTermDebtEquityQuarterly = longTermDebtEquityQuarterly;
    _marketCapitalization = marketCapitalization;
    _monthToDatePriceReturnDaily = monthToDatePriceReturnDaily;
    _netDebtAnnual = netDebtAnnual;
    _netDebtInterim = netDebtInterim;
    _netIncomeEmployeeAnnual = netIncomeEmployeeAnnual;
    _netIncomeEmployeeTTM = netIncomeEmployeeTTM;
    _netInterestCoverageAnnual = netInterestCoverageAnnual;
    _netInterestCoverageTTM = netInterestCoverageTTM;
    _netMarginGrowth5Y = netMarginGrowth5Y;
    _netProfitMargin5Y = netProfitMargin5Y;
    _netProfitMarginAnnual = netProfitMarginAnnual;
    _netProfitMarginTTM = netProfitMarginTTM;
    _operatingMargin5Y = operatingMargin5Y;
    _operatingMarginAnnual = operatingMarginAnnual;
    _operatingMarginTTM = operatingMarginTTM;
    _payoutRatioAnnual = payoutRatioAnnual;
    _payoutRatioTTM = payoutRatioTTM;
    _pbAnnual = pbAnnual;
    _pbQuarterly = pbQuarterly;
    _pcfShareTTM = pcfShareTTM;
    _peBasicExclExtraTTM = peBasicExclExtraTTM;
    _peExclExtraAnnual = peExclExtraAnnual;
    _peExclExtraHighTTM = peExclExtraHighTTM;
    _peExclExtraTTM = peExclExtraTTM;
    _peExclLowTTM = peExclLowTTM;
    _peInclExtraTTM = peInclExtraTTM;
    _peNormalizedAnnual = peNormalizedAnnual;
    _pfcfShareAnnual = pfcfShareAnnual;
    _pfcfShareTTM = pfcfShareTTM;
    _pretaxMargin5Y = pretaxMargin5Y;
    _pretaxMarginAnnual = pretaxMarginAnnual;
    _pretaxMarginTTM = pretaxMarginTTM;
    _priceRelativeToSP50013Week = priceRelativeToSP50013Week;
    _priceRelativeToSP50026Week = priceRelativeToSP50026Week;
    _priceRelativeToSP5004Week = priceRelativeToSP5004Week;
    _priceRelativeToSP50052Week = priceRelativeToSP50052Week;
    _priceRelativeToSP500Ytd = priceRelativeToSP500Ytd;
    _psAnnual = psAnnual;
    _psTTM = psTTM;
    _ptbvAnnual = ptbvAnnual;
    _ptbvQuarterly = ptbvQuarterly;
    _quickRatioAnnual = quickRatioAnnual;
    _quickRatioQuarterly = quickRatioQuarterly;
    _receivablesTurnoverAnnual = receivablesTurnoverAnnual;
    _receivablesTurnoverTTM = receivablesTurnoverTTM;
    _revenueEmployeeAnnual = revenueEmployeeAnnual;
    _revenueEmployeeTTM = revenueEmployeeTTM;
    _revenueGrowth3Y = revenueGrowth3Y;
    _revenueGrowth5Y = revenueGrowth5Y;
    _revenueGrowthQuarterlyYoy = revenueGrowthQuarterlyYoy;
    _revenueGrowthTTMYoy = revenueGrowthTTMYoy;
    _revenuePerShareAnnual = revenuePerShareAnnual;
    _revenuePerShareTTM = revenuePerShareTTM;
    _revenueShareGrowth5Y = revenueShareGrowth5Y;
    _roaRfy = roaRfy;
    _roaa5Y = roaa5Y;
    _roae5Y = roae5Y;
    _roaeTTM = roaeTTM;
    _roeRfy = roeRfy;
    _roeTTM = roeTTM;
    _roi5Y = roi5Y;
    _roiAnnual = roiAnnual;
    _roiTTM = roiTTM;
    _tangibleBookValuePerShareAnnual = tangibleBookValuePerShareAnnual;
    _tangibleBookValuePerShareQuarterly = tangibleBookValuePerShareQuarterly;
    _tbvCagr5Y = tbvCagr5Y;
    _totalDebtTotalEquityAnnual = totalDebtTotalEquityAnnual;
    _totalDebtTotalEquityQuarterly = totalDebtTotalEquityQuarterly;
    _totalDebtCagr5Y = totalDebtCagr5Y;
    _yearToDatePriceReturnDaily = yearToDatePriceReturnDaily;
}

  Metric.fromJson(dynamic json) {
    _10DayAverageTradingVolume = json["10DayAverageTradingVolume"];
    _13WeekPriceReturnDaily = json["13WeekPriceReturnDaily"];
    _26WeekPriceReturnDaily = json["26WeekPriceReturnDaily"];
    _3MonthAverageTradingVolume = json["3MonthAverageTradingVolume"];
    _52WeekHigh = json["52WeekHigh"];
    _52WeekHighDate = json["52WeekHighDate"];
    _52WeekLow = json["52WeekLow"];
    _52WeekLowDate = json["52WeekLowDate"];
    _52WeekPriceReturnDaily = json["52WeekPriceReturnDaily"];
    _5DayPriceReturnDaily = json["5DayPriceReturnDaily"];
    _assetTurnoverAnnual = json["assetTurnoverAnnual"];
    _assetTurnoverTTM = json["assetTurnoverTTM"];
    _beta = json["beta"];
    _bookValuePerShareAnnual = json["bookValuePerShareAnnual"];
    _bookValuePerShareQuarterly = json["bookValuePerShareQuarterly"];
    _bookValueShareGrowth5Y = json["bookValueShareGrowth5Y"];
    _capitalSpendingGrowth5Y = json["capitalSpendingGrowth5Y"];
    _cashFlowPerShareAnnual = json["cashFlowPerShareAnnual"];
    _cashFlowPerShareTTM = json["cashFlowPerShareTTM"];
    _cashPerSharePerShareAnnual = json["cashPerSharePerShareAnnual"];
    _cashPerSharePerShareQuarterly = json["cashPerSharePerShareQuarterly"];
    _currentDividendYieldTTM = json["currentDividendYieldTTM"];
    _currentEvFreeCashFlowAnnual = json["currentEv/freeCashFlowAnnual"];
    _currentEvFreeCashFlowTTM = json["currentEv/freeCashFlowTTM"];
    _currentRatioAnnual = json["currentRatioAnnual"];
    _currentRatioQuarterly = json["currentRatioQuarterly"];
    _dividendGrowthRate5Y = json["dividendGrowthRate5Y"];
    _dividendPerShare5Y = json["dividendPerShare5Y"];
    _dividendPerShareAnnual = json["dividendPerShareAnnual"];
    _dividendYield5Y = json["dividendYield5Y"];
    _dividendYieldIndicatedAnnual = json["dividendYieldIndicatedAnnual"];
    _dividendsPerShareTTM = json["dividendsPerShareTTM"];
    _ebitdPerShareTTM = json["ebitdPerShareTTM"];
    _ebitdaCagr5Y = json["ebitdaCagr5Y"];
    _ebitdaInterimCagr5Y = json["ebitdaInterimCagr5Y"];
    _epsBasicExclExtraItemsAnnual = json["epsBasicExclExtraItemsAnnual"];
    _epsBasicExclExtraItemsTTM = json["epsBasicExclExtraItemsTTM"];
    _epsExclExtraItemsAnnual = json["epsExclExtraItemsAnnual"];
    _epsExclExtraItemsTTM = json["epsExclExtraItemsTTM"];
    _epsGrowth3Y = json["epsGrowth3Y"];
    _epsGrowth5Y = json["epsGrowth5Y"];
    _epsGrowthQuarterlyYoy = json["epsGrowthQuarterlyYoy"];
    _epsGrowthTTMYoy = json["epsGrowthTTMYoy"];
    _epsInclExtraItemsAnnual = json["epsInclExtraItemsAnnual"];
    _epsInclExtraItemsTTM = json["epsInclExtraItemsTTM"];
    _epsNormalizedAnnual = json["epsNormalizedAnnual"];
    _focfCagr5Y = json["focfCagr5Y"];
    _freeCashFlowAnnual = json["freeCashFlowAnnual"];
    _freeCashFlowPerShareTTM = json["freeCashFlowPerShareTTM"];
    _freeCashFlowTTM = json["freeCashFlowTTM"];
    _freeOperatingCashFlowRevenue5Y = json["freeOperatingCashFlow/revenue5Y"];
    _freeOperatingCashFlowRevenueTTM = json["freeOperatingCashFlow/revenueTTM"];
    _grossMargin5Y = json["grossMargin5Y"];
    _grossMarginAnnual = json["grossMarginAnnual"];
    _grossMarginTTM = json["grossMarginTTM"];
    _inventoryTurnoverAnnual = json["inventoryTurnoverAnnual"];
    _inventoryTurnoverTTM = json["inventoryTurnoverTTM"];
    _longTermDebtEquityAnnual = json["longTermDebt/equityAnnual"];
    _longTermDebtEquityQuarterly = json["longTermDebt/equityQuarterly"];
    _marketCapitalization = json["marketCapitalization"];
    _monthToDatePriceReturnDaily = json["monthToDatePriceReturnDaily"];
    _netDebtAnnual = json["netDebtAnnual"];
    _netDebtInterim = json["netDebtInterim"];
    _netIncomeEmployeeAnnual = json["netIncomeEmployeeAnnual"];
    _netIncomeEmployeeTTM = json["netIncomeEmployeeTTM"];
    _netInterestCoverageAnnual = json["netInterestCoverageAnnual"];
    _netInterestCoverageTTM = json["netInterestCoverageTTM"];
    _netMarginGrowth5Y = json["netMarginGrowth5Y"];
    _netProfitMargin5Y = json["netProfitMargin5Y"];
    _netProfitMarginAnnual = json["netProfitMarginAnnual"];
    _netProfitMarginTTM = json["netProfitMarginTTM"];
    _operatingMargin5Y = json["operatingMargin5Y"];
    _operatingMarginAnnual = json["operatingMarginAnnual"];
    _operatingMarginTTM = json["operatingMarginTTM"];
    _payoutRatioAnnual = json["payoutRatioAnnual"];
    _payoutRatioTTM = json["payoutRatioTTM"];
    _pbAnnual = json["pbAnnual"];
    _pbQuarterly = json["pbQuarterly"];
    _pcfShareTTM = json["pcfShareTTM"];
    _peBasicExclExtraTTM = json["peBasicExclExtraTTM"];
    _peExclExtraAnnual = json["peExclExtraAnnual"];
    _peExclExtraHighTTM = json["peExclExtraHighTTM"];
    _peExclExtraTTM = json["peExclExtraTTM"];
    _peExclLowTTM = json["peExclLowTTM"];
    _peInclExtraTTM = json["peInclExtraTTM"];
    _peNormalizedAnnual = json["peNormalizedAnnual"];
    _pfcfShareAnnual = json["pfcfShareAnnual"];
    _pfcfShareTTM = json["pfcfShareTTM"];
    _pretaxMargin5Y = json["pretaxMargin5Y"];
    _pretaxMarginAnnual = json["pretaxMarginAnnual"];
    _pretaxMarginTTM = json["pretaxMarginTTM"];
    _priceRelativeToSP50013Week = json["priceRelativeToS&P50013Week"];
    _priceRelativeToSP50026Week = json["priceRelativeToS&P50026Week"];
    _priceRelativeToSP5004Week = json["priceRelativeToS&P5004Week"];
    _priceRelativeToSP50052Week = json["priceRelativeToS&P50052Week"];
    _priceRelativeToSP500Ytd = json["priceRelativeToS&P500Ytd"];
    _psAnnual = json["psAnnual"];
    _psTTM = json["psTTM"];
    _ptbvAnnual = json["ptbvAnnual"];
    _ptbvQuarterly = json["ptbvQuarterly"];
    _quickRatioAnnual = json["quickRatioAnnual"];
    _quickRatioQuarterly = json["quickRatioQuarterly"];
    _receivablesTurnoverAnnual = json["receivablesTurnoverAnnual"];
    _receivablesTurnoverTTM = json["receivablesTurnoverTTM"];
    _revenueEmployeeAnnual = json["revenueEmployeeAnnual"];
    _revenueEmployeeTTM = json["revenueEmployeeTTM"];
    _revenueGrowth3Y = json["revenueGrowth3Y"];
    _revenueGrowth5Y = json["revenueGrowth5Y"];
    _revenueGrowthQuarterlyYoy = json["revenueGrowthQuarterlyYoy"];
    _revenueGrowthTTMYoy = json["revenueGrowthTTMYoy"];
    _revenuePerShareAnnual = json["revenuePerShareAnnual"];
    _revenuePerShareTTM = json["revenuePerShareTTM"];
    _revenueShareGrowth5Y = json["revenueShareGrowth5Y"];
    _roaRfy = json["roaRfy"];
    _roaa5Y = json["roaa5Y"];
    _roae5Y = json["roae5Y"];
    _roaeTTM = json["roaeTTM"];
    _roeRfy = json["roeRfy"];
    _roeTTM = json["roeTTM"];
    _roi5Y = json["roi5Y"];
    _roiAnnual = json["roiAnnual"];
    _roiTTM = json["roiTTM"];
    _tangibleBookValuePerShareAnnual = json["tangibleBookValuePerShareAnnual"];
    _tangibleBookValuePerShareQuarterly = json["tangibleBookValuePerShareQuarterly"];
    _tbvCagr5Y = json["tbvCagr5Y"];
    _totalDebtTotalEquityAnnual = json["totalDebt/totalEquityAnnual"];
    _totalDebtTotalEquityQuarterly = json["totalDebt/totalEquityQuarterly"];
    _totalDebtCagr5Y = json["totalDebtCagr5Y"];
    _yearToDatePriceReturnDaily = json["yearToDatePriceReturnDaily"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["10DayAverageTradingVolume"] = _10DayAverageTradingVolume;
    map["13WeekPriceReturnDaily"] = _13WeekPriceReturnDaily;
    map["26WeekPriceReturnDaily"] = _26WeekPriceReturnDaily;
    map["3MonthAverageTradingVolume"] = _3MonthAverageTradingVolume;
    map["52WeekHigh"] = _52WeekHigh;
    map["52WeekHighDate"] = _52WeekHighDate;
    map["52WeekLow"] = _52WeekLow;
    map["52WeekLowDate"] = _52WeekLowDate;
    map["52WeekPriceReturnDaily"] = _52WeekPriceReturnDaily;
    map["5DayPriceReturnDaily"] = _5DayPriceReturnDaily;
    map["assetTurnoverAnnual"] = _assetTurnoverAnnual;
    map["assetTurnoverTTM"] = _assetTurnoverTTM;
    map["beta"] = _beta;
    map["bookValuePerShareAnnual"] = _bookValuePerShareAnnual;
    map["bookValuePerShareQuarterly"] = _bookValuePerShareQuarterly;
    map["bookValueShareGrowth5Y"] = _bookValueShareGrowth5Y;
    map["capitalSpendingGrowth5Y"] = _capitalSpendingGrowth5Y;
    map["cashFlowPerShareAnnual"] = _cashFlowPerShareAnnual;
    map["cashFlowPerShareTTM"] = _cashFlowPerShareTTM;
    map["cashPerSharePerShareAnnual"] = _cashPerSharePerShareAnnual;
    map["cashPerSharePerShareQuarterly"] = _cashPerSharePerShareQuarterly;
    map["currentDividendYieldTTM"] = _currentDividendYieldTTM;
    map["currentEv/freeCashFlowAnnual"] = _currentEvFreeCashFlowAnnual;
    map["currentEv/freeCashFlowTTM"] = _currentEvFreeCashFlowTTM;
    map["currentRatioAnnual"] = _currentRatioAnnual;
    map["currentRatioQuarterly"] = _currentRatioQuarterly;
    map["dividendGrowthRate5Y"] = _dividendGrowthRate5Y;
    map["dividendPerShare5Y"] = _dividendPerShare5Y;
    map["dividendPerShareAnnual"] = _dividendPerShareAnnual;
    map["dividendYield5Y"] = _dividendYield5Y;
    map["dividendYieldIndicatedAnnual"] = _dividendYieldIndicatedAnnual;
    map["dividendsPerShareTTM"] = _dividendsPerShareTTM;
    map["ebitdPerShareTTM"] = _ebitdPerShareTTM;
    map["ebitdaCagr5Y"] = _ebitdaCagr5Y;
    map["ebitdaInterimCagr5Y"] = _ebitdaInterimCagr5Y;
    map["epsBasicExclExtraItemsAnnual"] = _epsBasicExclExtraItemsAnnual;
    map["epsBasicExclExtraItemsTTM"] = _epsBasicExclExtraItemsTTM;
    map["epsExclExtraItemsAnnual"] = _epsExclExtraItemsAnnual;
    map["epsExclExtraItemsTTM"] = _epsExclExtraItemsTTM;
    map["epsGrowth3Y"] = _epsGrowth3Y;
    map["epsGrowth5Y"] = _epsGrowth5Y;
    map["epsGrowthQuarterlyYoy"] = _epsGrowthQuarterlyYoy;
    map["epsGrowthTTMYoy"] = _epsGrowthTTMYoy;
    map["epsInclExtraItemsAnnual"] = _epsInclExtraItemsAnnual;
    map["epsInclExtraItemsTTM"] = _epsInclExtraItemsTTM;
    map["epsNormalizedAnnual"] = _epsNormalizedAnnual;
    map["focfCagr5Y"] = _focfCagr5Y;
    map["freeCashFlowAnnual"] = _freeCashFlowAnnual;
    map["freeCashFlowPerShareTTM"] = _freeCashFlowPerShareTTM;
    map["freeCashFlowTTM"] = _freeCashFlowTTM;
    map["freeOperatingCashFlow/revenue5Y"] = _freeOperatingCashFlowRevenue5Y;
    map["freeOperatingCashFlow/revenueTTM"] = _freeOperatingCashFlowRevenueTTM;
    map["grossMargin5Y"] = _grossMargin5Y;
    map["grossMarginAnnual"] = _grossMarginAnnual;
    map["grossMarginTTM"] = _grossMarginTTM;
    map["inventoryTurnoverAnnual"] = _inventoryTurnoverAnnual;
    map["inventoryTurnoverTTM"] = _inventoryTurnoverTTM;
    map["longTermDebt/equityAnnual"] = _longTermDebtEquityAnnual;
    map["longTermDebt/equityQuarterly"] = _longTermDebtEquityQuarterly;
    map["marketCapitalization"] = _marketCapitalization;
    map["monthToDatePriceReturnDaily"] = _monthToDatePriceReturnDaily;
    map["netDebtAnnual"] = _netDebtAnnual;
    map["netDebtInterim"] = _netDebtInterim;
    map["netIncomeEmployeeAnnual"] = _netIncomeEmployeeAnnual;
    map["netIncomeEmployeeTTM"] = _netIncomeEmployeeTTM;
    map["netInterestCoverageAnnual"] = _netInterestCoverageAnnual;
    map["netInterestCoverageTTM"] = _netInterestCoverageTTM;
    map["netMarginGrowth5Y"] = _netMarginGrowth5Y;
    map["netProfitMargin5Y"] = _netProfitMargin5Y;
    map["netProfitMarginAnnual"] = _netProfitMarginAnnual;
    map["netProfitMarginTTM"] = _netProfitMarginTTM;
    map["operatingMargin5Y"] = _operatingMargin5Y;
    map["operatingMarginAnnual"] = _operatingMarginAnnual;
    map["operatingMarginTTM"] = _operatingMarginTTM;
    map["payoutRatioAnnual"] = _payoutRatioAnnual;
    map["payoutRatioTTM"] = _payoutRatioTTM;
    map["pbAnnual"] = _pbAnnual;
    map["pbQuarterly"] = _pbQuarterly;
    map["pcfShareTTM"] = _pcfShareTTM;
    map["peBasicExclExtraTTM"] = _peBasicExclExtraTTM;
    map["peExclExtraAnnual"] = _peExclExtraAnnual;
    map["peExclExtraHighTTM"] = _peExclExtraHighTTM;
    map["peExclExtraTTM"] = _peExclExtraTTM;
    map["peExclLowTTM"] = _peExclLowTTM;
    map["peInclExtraTTM"] = _peInclExtraTTM;
    map["peNormalizedAnnual"] = _peNormalizedAnnual;
    map["pfcfShareAnnual"] = _pfcfShareAnnual;
    map["pfcfShareTTM"] = _pfcfShareTTM;
    map["pretaxMargin5Y"] = _pretaxMargin5Y;
    map["pretaxMarginAnnual"] = _pretaxMarginAnnual;
    map["pretaxMarginTTM"] = _pretaxMarginTTM;
    map["priceRelativeToS&P50013Week"] = _priceRelativeToSP50013Week;
    map["priceRelativeToS&P50026Week"] = _priceRelativeToSP50026Week;
    map["priceRelativeToS&P5004Week"] = _priceRelativeToSP5004Week;
    map["priceRelativeToS&P50052Week"] = _priceRelativeToSP50052Week;
    map["priceRelativeToS&P500Ytd"] = _priceRelativeToSP500Ytd;
    map["psAnnual"] = _psAnnual;
    map["psTTM"] = _psTTM;
    map["ptbvAnnual"] = _ptbvAnnual;
    map["ptbvQuarterly"] = _ptbvQuarterly;
    map["quickRatioAnnual"] = _quickRatioAnnual;
    map["quickRatioQuarterly"] = _quickRatioQuarterly;
    map["receivablesTurnoverAnnual"] = _receivablesTurnoverAnnual;
    map["receivablesTurnoverTTM"] = _receivablesTurnoverTTM;
    map["revenueEmployeeAnnual"] = _revenueEmployeeAnnual;
    map["revenueEmployeeTTM"] = _revenueEmployeeTTM;
    map["revenueGrowth3Y"] = _revenueGrowth3Y;
    map["revenueGrowth5Y"] = _revenueGrowth5Y;
    map["revenueGrowthQuarterlyYoy"] = _revenueGrowthQuarterlyYoy;
    map["revenueGrowthTTMYoy"] = _revenueGrowthTTMYoy;
    map["revenuePerShareAnnual"] = _revenuePerShareAnnual;
    map["revenuePerShareTTM"] = _revenuePerShareTTM;
    map["revenueShareGrowth5Y"] = _revenueShareGrowth5Y;
    map["roaRfy"] = _roaRfy;
    map["roaa5Y"] = _roaa5Y;
    map["roae5Y"] = _roae5Y;
    map["roaeTTM"] = _roaeTTM;
    map["roeRfy"] = _roeRfy;
    map["roeTTM"] = _roeTTM;
    map["roi5Y"] = _roi5Y;
    map["roiAnnual"] = _roiAnnual;
    map["roiTTM"] = _roiTTM;
    map["tangibleBookValuePerShareAnnual"] = _tangibleBookValuePerShareAnnual;
    map["tangibleBookValuePerShareQuarterly"] = _tangibleBookValuePerShareQuarterly;
    map["tbvCagr5Y"] = _tbvCagr5Y;
    map["totalDebt/totalEquityAnnual"] = _totalDebtTotalEquityAnnual;
    map["totalDebt/totalEquityQuarterly"] = _totalDebtTotalEquityQuarterly;
    map["totalDebtCagr5Y"] = _totalDebtCagr5Y;
    map["yearToDatePriceReturnDaily"] = _yearToDatePriceReturnDaily;
    return map;
  }

}