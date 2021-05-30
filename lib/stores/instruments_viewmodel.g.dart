// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruments_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InstrumentsViewModel on _InstrumentsViewModelBase, Store {
  final _$companyLoadingStateAtom =
      Atom(name: '_InstrumentsViewModelBase.companyLoadingState');

  @override
  LoadingState get companyLoadingState {
    _$companyLoadingStateAtom.reportRead();
    return super.companyLoadingState;
  }

  @override
  set companyLoadingState(LoadingState value) {
    _$companyLoadingStateAtom.reportWrite(value, super.companyLoadingState, () {
      super.companyLoadingState = value;
    });
  }

  final _$companyNewsLoadingStateAtom =
      Atom(name: '_InstrumentsViewModelBase.companyNewsLoadingState');

  @override
  LoadingState get companyNewsLoadingState {
    _$companyNewsLoadingStateAtom.reportRead();
    return super.companyNewsLoadingState;
  }

  @override
  set companyNewsLoadingState(LoadingState value) {
    _$companyNewsLoadingStateAtom
        .reportWrite(value, super.companyNewsLoadingState, () {
      super.companyNewsLoadingState = value;
    });
  }

  final _$companyNewsSentimentStateAtom =
      Atom(name: '_InstrumentsViewModelBase.companyNewsSentimentState');

  @override
  LoadingState get companyNewsSentimentState {
    _$companyNewsSentimentStateAtom.reportRead();
    return super.companyNewsSentimentState;
  }

  @override
  set companyNewsSentimentState(LoadingState value) {
    _$companyNewsSentimentStateAtom
        .reportWrite(value, super.companyNewsSentimentState, () {
      super.companyNewsSentimentState = value;
    });
  }

  final _$recommendationStateAtom =
      Atom(name: '_InstrumentsViewModelBase.recommendationState');

  @override
  LoadingState get recommendationState {
    _$recommendationStateAtom.reportRead();
    return super.recommendationState;
  }

  @override
  set recommendationState(LoadingState value) {
    _$recommendationStateAtom.reportWrite(value, super.recommendationState, () {
      super.recommendationState = value;
    });
  }

  final _$aggregateSignalStateAtom =
      Atom(name: '_InstrumentsViewModelBase.aggregateSignalState');

  @override
  LoadingState get aggregateSignalState {
    _$aggregateSignalStateAtom.reportRead();
    return super.aggregateSignalState;
  }

  @override
  set aggregateSignalState(LoadingState value) {
    _$aggregateSignalStateAtom.reportWrite(value, super.aggregateSignalState,
        () {
      super.aggregateSignalState = value;
    });
  }

  final _$getCompanyProfileAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.getCompanyProfile');

  @override
  Future<dynamic> getCompanyProfile(String symbol) {
    return _$getCompanyProfileAsyncAction
        .run(() => super.getCompanyProfile(symbol));
  }

  final _$refreshCompanyProfileAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.refreshCompanyProfile');

  @override
  Future<dynamic> refreshCompanyProfile(String symbol) {
    return _$refreshCompanyProfileAsyncAction
        .run(() => super.refreshCompanyProfile(symbol));
  }

  final _$getCompanyNewsAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.getCompanyNews');

  @override
  Future<dynamic> getCompanyNews(String symbol) {
    return _$getCompanyNewsAsyncAction.run(() => super.getCompanyNews(symbol));
  }

  final _$refreshCompanyNewsAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.refreshCompanyNews');

  @override
  Future<dynamic> refreshCompanyNews(String symbol) {
    return _$refreshCompanyNewsAsyncAction
        .run(() => super.refreshCompanyNews(symbol));
  }

  final _$getCompanyNewsSentimentAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.getCompanyNewsSentiment');

  @override
  Future<dynamic> getCompanyNewsSentiment(String symbol) {
    return _$getCompanyNewsSentimentAsyncAction
        .run(() => super.getCompanyNewsSentiment(symbol));
  }

  final _$refreshCompanyNewsSentimentAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.refreshCompanyNewsSentiment');

  @override
  Future<dynamic> refreshCompanyNewsSentiment(String symbol) {
    return _$refreshCompanyNewsSentimentAsyncAction
        .run(() => super.refreshCompanyNewsSentiment(symbol));
  }

  final _$getRecommendationsAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.getRecommendations');

  @override
  Future<dynamic> getRecommendations(String symbol) {
    return _$getRecommendationsAsyncAction
        .run(() => super.getRecommendations(symbol));
  }

  final _$refreshRecommendationsAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.refreshRecommendations');

  @override
  Future<dynamic> refreshRecommendations(String symbol) {
    return _$refreshRecommendationsAsyncAction
        .run(() => super.refreshRecommendations(symbol));
  }

  final _$getAggregateSignalAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.getAggregateSignal');

  @override
  Future<dynamic> getAggregateSignal(String symbol) {
    return _$getAggregateSignalAsyncAction
        .run(() => super.getAggregateSignal(symbol));
  }

  final _$refreshAggregateSignalAsyncAction =
      AsyncAction('_InstrumentsViewModelBase.refreshAggregateSignal');

  @override
  Future<dynamic> refreshAggregateSignal(String symbol) {
    return _$refreshAggregateSignalAsyncAction
        .run(() => super.refreshAggregateSignal(symbol));
  }

  final _$loadAllAsyncAction = AsyncAction('_InstrumentsViewModelBase.loadAll');

  @override
  Future<dynamic> loadAll(String symbol) {
    return _$loadAllAsyncAction.run(() => super.loadAll(symbol));
  }

  @override
  String toString() {
    return '''
companyLoadingState: ${companyLoadingState},
companyNewsLoadingState: ${companyNewsLoadingState},
companyNewsSentimentState: ${companyNewsSentimentState},
recommendationState: ${recommendationState},
aggregateSignalState: ${aggregateSignalState}
    ''';
  }
}
