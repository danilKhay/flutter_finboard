// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentiment_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SentimentViewModel on _SentimentViewModelBase, Store {
  final _$companySentimentStateAtom =
      Atom(name: '_SentimentViewModelBase.companySentimentState');

  @override
  SentimentState get companySentimentState {
    _$companySentimentStateAtom.reportRead();
    return super.companySentimentState;
  }

  @override
  set companySentimentState(SentimentState value) {
    _$companySentimentStateAtom.reportWrite(value, super.companySentimentState,
        () {
      super.companySentimentState = value;
    });
  }

  final _$getCompanyNewsSentimentAsyncAction =
      AsyncAction('_SentimentViewModelBase.getCompanyNewsSentiment');

  @override
  Future<dynamic> getCompanyNewsSentiment(String symbol) {
    return _$getCompanyNewsSentimentAsyncAction
        .run(() => super.getCompanyNewsSentiment(symbol));
  }

  final _$getSocialNetworkSentimentAsyncAction =
      AsyncAction('_SentimentViewModelBase.getSocialNetworkSentiment');

  @override
  Future<dynamic> getSocialNetworkSentiment(String symbol) {
    return _$getSocialNetworkSentimentAsyncAction
        .run(() => super.getSocialNetworkSentiment(symbol));
  }

  final _$getNewsBuzzSentimentAsyncAction =
      AsyncAction('_SentimentViewModelBase.getNewsBuzzSentiment');

  @override
  Future<dynamic> getNewsBuzzSentiment(String symbol) {
    return _$getNewsBuzzSentimentAsyncAction
        .run(() => super.getNewsBuzzSentiment(symbol));
  }

  final _$refreshCompanyNewsSentimentAsyncAction =
      AsyncAction('_SentimentViewModelBase.refreshCompanyNewsSentiment');

  @override
  Future<dynamic> refreshCompanyNewsSentiment(String symbol) {
    return _$refreshCompanyNewsSentimentAsyncAction
        .run(() => super.refreshCompanyNewsSentiment(symbol));
  }

  final _$loadAsyncAction = AsyncAction('_SentimentViewModelBase.load');

  @override
  Future<dynamic> load(String symbol) {
    return _$loadAsyncAction.run(() => super.load(symbol));
  }

  @override
  String toString() {
    return '''
companySentimentState: ${companySentimentState}
    ''';
  }
}
