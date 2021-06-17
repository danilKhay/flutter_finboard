import 'package:finboard_app/entities/daily_market_cap.dart';
import 'package:finboard_app/models/mappers/mapper.dart';

import '../daily_market_cap_model.dart';

class DailyMarketCapMapper
    implements Mapper<DailyMarketCap, List<DailyMarketCapModel>> {
  @override
  List<DailyMarketCapModel> mapTo(DailyMarketCap entity) {
    return entity.data
        .map((e) => DailyMarketCapModel(DateTime.parse(e.date), e.marketcap)).toList();
  }
}
