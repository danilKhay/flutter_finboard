import 'package:dartz/dartz.dart';
import 'package:finboard_app/core/error/failures.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/company_profile_model.dart';

abstract class CompanyRepositoryContract {
  Future<Either<Failure, CompanyProfileModel>> getCompanyProfile(String symbol);

  Future<Either<Failure, List<CompanyNews>>> getCompanyNews(
      String symbol, DateTime fromDate, DateTime toDate);

  Future<Either<Failure, CompanyNewsSentiment>> getCompanyNewsSentiment(
      String symbol);

  Future<Either<Failure, bool>> isUSCompanySymbol(String symbol);
}
