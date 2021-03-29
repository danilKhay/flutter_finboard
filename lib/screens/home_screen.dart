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
    final api = serviceLocator.get<FinHubApi>();
    api.getCompanyProfile(token: apiKey, symbol: 'NVDA').then((value) => setState(() => companyProfile = value));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            if (companyProfile != null) CompanyProfileWidget(companyProfile: companyProfile,),
          ],
        ),
      ),
    );
  }
}
