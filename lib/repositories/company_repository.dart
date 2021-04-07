import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/services/finnhub_rest_service/finnhub_rest_service.dart';
import '../utils/utils.dart';

class CompanyRepository {
  final FinnhubRestService _finnhubRestService;

  CompanyRepository(this._finnhubRestService);

  Future<Either<Failure, CompanyProfileModel>> getCompanyProfile(String symbol) async {
    try {
      final companyProfile = await _finnhubRestService.getCompanyProfile(symbol);
      return right(CompanyProfileModel.fromEntity(companyProfile));
    } catch(e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, List<CompanyNews>>> getCompanyNews(String symbol, DateTime fromDate, DateTime toDate) async {
    try {
      final companyNews = await _finnhubRestService.getCompanyNews(symbol, fromDate.toFinnHubString(), toDate.toFinnHubString());
      return right(companyNews);
    } catch(e) {
      return left(BasicFailure());
    }
  }

  Future<Either<Failure, CompanyNewsSentiment>> getCompanyNewsSentiment(String symbol) async {
    try {
      final companyNewsSentiment = await _finnhubRestService.getCompanyNewsSentiment(symbol);
      return right(companyNewsSentiment);
    } catch(e) {
      return left(BasicFailure());
    }
  }
}