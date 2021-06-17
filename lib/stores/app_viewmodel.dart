import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/repositories/contracts/chart_repository_contract.dart';
import 'package:finboard_app/repositories/contracts/company_repository_contract.dart';
import 'package:mobx/mobx.dart';

part 'app_viewmodel.g.dart';

class AppViewModel = _AppViewModelBase with _$AppViewModel;

abstract class _AppViewModelBase with Store {
  final companyRepo = serviceLocator.get<CompanyRepositoryContract>();
  final chartRepo = serviceLocator.get<ChartRepositoryContract>();

  String ticker = 'NVDA';

  @observable
  TickerState tickerState = TickerState.none;

  @observable
  String errorMessage;

  @action
  Future getTicker(String symbol) async {
    tickerState = TickerState.loading;
    final result = await companyRepo.isUSCompanySymbol(symbol);
    result.fold((l) {
      errorMessage = 'Error. Wrong Ticker $symbol. Only US Market.';
      tickerState = TickerState.none;
    }, (r) {
      ticker = symbol;
      tickerState = TickerState.success;
    });
  }

  @action
  void removeTicker() {
    tickerState = TickerState.none;
  }
}

enum TickerState {
  none,
  loading,
  success,
}
