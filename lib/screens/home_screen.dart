import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final api = serviceLocator.get<FinHubApi>();
    api.searchSymbolsByName(searchQuery: "apple", token: apiKey).then((value) => value.result.forEach((element) {print('Symbol: ${element.displaySymbol} Type: ${element.type}');}));
    api.getStocks(token: apiKey, exchange: 'US').then((value) => value.forEach((element) {print(element.symbol);}));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 500,
        color: Colors.indigo,
      ),
    );
  }
}
