import 'package:finboard_app/entities/company_profile.dart';
import 'package:finboard_app/services/finnhub_rest_service/finnhub_rest_service.dart';

class CompanyRepository {
  final FinnhubRestService _finnhubRestService;

  CompanyRepository(this._finnhubRestService);

  Future<CompanyProfile> getCompanyProfile(String symbol) async {
    final companyProfile = await _finnhubRestService.getCompanyProfile(symbol);
    return companyProfile;
  }
}