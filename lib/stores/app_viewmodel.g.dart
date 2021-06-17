// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppViewModel on _AppViewModelBase, Store {
  final _$tickerStateAtom = Atom(name: '_AppViewModelBase.tickerState');

  @override
  TickerState get tickerState {
    _$tickerStateAtom.reportRead();
    return super.tickerState;
  }

  @override
  set tickerState(TickerState value) {
    _$tickerStateAtom.reportWrite(value, super.tickerState, () {
      super.tickerState = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AppViewModelBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getTickerAsyncAction = AsyncAction('_AppViewModelBase.getTicker');

  @override
  Future<dynamic> getTicker(String symbol) {
    return _$getTickerAsyncAction.run(() => super.getTicker(symbol));
  }

  final _$_AppViewModelBaseActionController =
      ActionController(name: '_AppViewModelBase');

  @override
  void removeTicker() {
    final _$actionInfo = _$_AppViewModelBaseActionController.startAction(
        name: '_AppViewModelBase.removeTicker');
    try {
      return super.removeTicker();
    } finally {
      _$_AppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tickerState: ${tickerState},
errorMessage: ${errorMessage}
    ''';
  }
}
