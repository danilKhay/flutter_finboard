import 'package:finboard_app/entities/company_profile.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/utils/constants.dart';

class CompanyRepository {
  final FinHubApi finHubApi;

  CompanyRepository(this.finHubApi);

  Future<CompanyProfile> getCompanyProfile(String symbol) async {
    final companyProfile = await finHubApi.getCompanyProfile(token: apiKey, symbol: symbol);
    return companyProfile;
  }
}