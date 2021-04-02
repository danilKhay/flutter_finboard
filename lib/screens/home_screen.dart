import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/company_profile.dart';
import 'package:finboard_app/repositories/company_repository.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/utils/constants.dart';
import 'package:finboard_app/widgets/charts/column_chart.dart';
import 'package:finboard_app/widgets/charts/open_close_chart.dart';
import 'package:finboard_app/widgets/charts/range_chart.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CompanyProfile companyProfile;
  @override
  void initState() {
    super.initState();
    final repo = serviceLocator.get<CompanyRepository>();
    repo.getCompanyProfile('AAPL').then((value) => setState(() => companyProfile = value));
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
                if (companyProfile != null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CompanyProfileWidget(companyProfile: companyProfile,),
                )),
                if (companyProfile == null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: Loading(),),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: RangeDataLabelExample(Key('rearsar')),),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(child: Loading(),),
                )),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
