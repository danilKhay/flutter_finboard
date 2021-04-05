import 'package:finboard_app/entities/company_profile.dart';

class CompanyProfileModel {
  final String webUrl;
  final String name;
  final String ticker;
  final String exchange;
  final String marketCap;
  final String industry;
  final String ipoDate;
  final String country;
  final String share;

  CompanyProfileModel(this.webUrl, this.name, this.ticker, this.exchange,
      this.marketCap, this.industry, this.ipoDate, this.country, this.share);

  factory CompanyProfileModel.fromEntity(CompanyProfile cp) {
    final marketCap = '${cp.marketCapitalization} millions ${cp.currency}';
    final share = '${cp.shareOutstanding.toString()} millions';
    return CompanyProfileModel(
        cp.weburl,
        '${cp.name} (${cp.ticker})',
        cp.ticker,
        cp.exchange,
        marketCap,
        cp.finnhubIndustry,
        cp.ipo,
        cp.country,
        share);
  }
}
