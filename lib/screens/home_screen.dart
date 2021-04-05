import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/entities.dart';
import 'package:finboard_app/models/company_profile_model.dart';
import 'package:finboard_app/repositories/company_repository.dart';
import 'package:finboard_app/widgets/charts/column_chart.dart';
import 'package:finboard_app/widgets/charts/open_close_chart.dart';
import 'package:finboard_app/widgets/charts/range_chart.dart';
import 'package:finboard_app/widgets/company_news_list.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CompanyProfileModel _cp;
  List<CompanyNews> _list;
  @override
  void initState() {
    super.initState();
    final repo = serviceLocator.get<CompanyRepository>();
    repo.getCompanyProfile('AAPL').then((value) => setState(() => value.fold((l) => _cp = null, (r) => _cp = r)));
    final today = DateTime.now();
    final fifteenDaysAgo = today.subtract(Duration(days: 15));
    repo.getCompanyNews('AAPL', fifteenDaysAgo, today).then((value) => setState(() => value.fold((l) => _list = null, (r) => _list = r)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FinBoard'),),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 3, child: Column(
              children: [
                Expanded(flex: 1, child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(child: Loading(),),
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(child: ColumnBack(Key('fsafa')),),
                    )),
                  ],
                ),),
                Expanded(flex: 2, child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: HiloOpenCloseChart(Key('fsafsaf')),),
                )),
              ],
            ),),
            Expanded(flex: 1, child: Column(
              children: [
                if (_cp != null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CompanyProfileWidget(cp: _cp,),
                )),
                if (_cp == null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: Loading(),),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: RangeDataLabelExample(Key('rearsar')),),
                )),
                if (_list == null) Expanded(flex: 2, child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: Loading(),),
                )),
               if (_list != null) Expanded(flex: 2, child: Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Card(child: CompanyNewsListWidget(companyNewsList: _list,),),
               )),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
