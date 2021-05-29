// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_chart_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainChartViewModel on _MainChartViewModelBase, Store {
  final _$mainChartStateAtom =
      Atom(name: '_MainChartViewModelBase.mainChartState');

  @override
  MainChartState get mainChartState {
    _$mainChartStateAtom.reportRead();
    return super.mainChartState;
  }

  @override
  set mainChartState(MainChartState value) {
    _$mainChartStateAtom.reportWrite(value, super.mainChartState, () {
      super.mainChartState = value;
    });
  }

  final _$candleStateAtom = Atom(name: '_MainChartViewModelBase.candleState');

  @override
  CandleState get candleState {
    _$candleStateAtom.reportRead();
    return super.candleState;
  }

  @override
  set candleState(CandleState value) {
    _$candleStateAtom.reportWrite(value, super.candleState, () {
      super.candleState = value;
    });
  }

  final _$candleInstrumentsAtom =
      Atom(name: '_MainChartViewModelBase.candleInstruments');

  @override
  CandleInstruments get candleInstruments {
    _$candleInstrumentsAtom.reportRead();
    return super.candleInstruments;
  }

  @override
  set candleInstruments(CandleInstruments value) {
    _$candleInstrumentsAtom.reportWrite(value, super.candleInstruments, () {
      super.candleInstruments = value;
    });
  }

  final _$marketCapInstrumentsAtom =
      Atom(name: '_MainChartViewModelBase.marketCapInstruments');

  @override
  MarketCapInstruments get marketCapInstruments {
    _$marketCapInstrumentsAtom.reportRead();
    return super.marketCapInstruments;
  }

  @override
  set marketCapInstruments(MarketCapInstruments value) {
    _$marketCapInstrumentsAtom.reportWrite(value, super.marketCapInstruments,
        () {
      super.marketCapInstruments = value;
    });
  }

  final _$getCandleDataAsyncAction =
      AsyncAction('_MainChartViewModelBase.getCandleData');

  @override
  Future<dynamic> getCandleData(String symbol) {
    return _$getCandleDataAsyncAction.run(() => super.getCandleData(symbol));
  }

  final _$getMarketCapAsyncAction =
      AsyncAction('_MainChartViewModelBase.getMarketCap');

  @override
  Future<dynamic> getMarketCap(String symbol) {
    return _$getMarketCapAsyncAction.run(() => super.getMarketCap(symbol));
  }

  final _$getResAndSupAsyncAction =
      AsyncAction('_MainChartViewModelBase.getResAndSup');

  @override
  Future<dynamic> getResAndSup(String symbol) {
    return _$getResAndSupAsyncAction.run(() => super.getResAndSup(symbol));
  }

  final _$getFairAsyncAction = AsyncAction('_MainChartViewModelBase.getFair');

  @override
  Future<dynamic> getFair(String symbol) {
    return _$getFairAsyncAction.run(() => super.getFair(symbol));
  }

  final _$getFairDiffAsyncAction =
      AsyncAction('_MainChartViewModelBase.getFairDiff');

  @override
  Future<dynamic> getFairDiff(String symbol) {
    return _$getFairDiffAsyncAction.run(() => super.getFairDiff(symbol));
  }

  final _$getDownLevelAsyncAction =
      AsyncAction('_MainChartViewModelBase.getDownLevel');

  @override
  Future<dynamic> getDownLevel(String symbol) {
    return _$getDownLevelAsyncAction.run(() => super.getDownLevel(symbol));
  }

  final _$_MainChartViewModelBaseActionController =
      ActionController(name: '_MainChartViewModelBase');

  @override
  void changeChartType() {
    final _$actionInfo = _$_MainChartViewModelBaseActionController.startAction(
        name: '_MainChartViewModelBase.changeChartType');
    try {
      return super.changeChartType();
    } finally {
      _$_MainChartViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mainChartState: ${mainChartState},
candleState: ${candleState},
candleInstruments: ${candleInstruments},
marketCapInstruments: ${marketCapInstruments}
    ''';
  }
}
