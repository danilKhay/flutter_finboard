class CandleChartData {
  final DateTime date;
  final double open;
  final double close;
  final double high;
  final double low;

  CandleChartData(this.date, this.open, this.close, this.high, this.low);
}

class CandlesModel {
  final List<CandleChartData> candles;
  final double maxPrice;
  final double minPrice;
  final String symbol;

  CandlesModel(this.candles, this.symbol, this.maxPrice, this.minPrice);

}