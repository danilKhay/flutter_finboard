import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/entities/company_profile.dart';
import 'package:finboard_app/services/api/finhub_api.dart';
import 'package:finboard_app/utils/constants.dart';
import 'package:finboard_app/widgets/company_profile_widget.dart';
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
    final api = serviceLocator.get<FinHubApi>();
    api.getCompanyProfile(token: Constants.apiKey, symbol: 'NVDA').then((value) => setState(() => companyProfile = value));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 3, child: Column(
              children: [
                Expanded(flex: 1, child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(),
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(),
                    )),
                  ],
                ),),
                Expanded(flex: 2, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(),
                )),
              ],
            ),),
            Expanded(flex: 1, child: Column(
              children: [
                if (companyProfile != null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompanyProfileWidget(companyProfile: companyProfile,),
                )),
                if (companyProfile == null) Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(),
                )),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
