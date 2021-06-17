import 'package:finboard_app/entities/fair_market_cap.dart';
import 'package:finboard_app/models/fair_market_cap_model.dart';
import 'package:finboard_app/models/mappers/mapper.dart';

class FairMarketCapMapper implements Mapper<FairMarketCap, List<FairMarketCapModel>> {

  @override
  List<FairMarketCapModel> mapTo(FairMarketCap entity) {
    return entity.data
        .map((e) => FairMarketCapModel(DateTime.parse(e.date), e.fairMarketcap)).toList();
  }
}