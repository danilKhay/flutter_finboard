import 'package:finboard_app/entities/fair_market_cap_diff.dart';
import 'package:finboard_app/models/fair_market_cap_diff_model.dart';
import 'package:finboard_app/models/mappers/mapper.dart';

class FairMarketCapDiffMapper
    implements Mapper<FairMarketCapDiff, List<FairMarketCapDiffModel>> {
  @override
  List<FairMarketCapDiffModel> mapTo(FairMarketCapDiff entity) {
    return entity.data
        .map((e) => FairMarketCapDiffModel(
            DateTime.parse(e.date), e.fairMarketcapViaDiff))
        .toList();
  }
}
