import 'package:finboard_app/entities/entities.dart';

import '../market_cap_down_level_model.dart';
import 'mapper.dart';

class MarketCapDownLevelMapper
    implements Mapper<MarketCapDownLevel, List<MarketCapDownLevelModel>> {
  @override
  List<MarketCapDownLevelModel> mapTo(MarketCapDownLevel entity) {
    return entity.data
        .map((e) => MarketCapDownLevelModel(DateTime.parse(e.date), e.value))
        .toList();
  }
}
