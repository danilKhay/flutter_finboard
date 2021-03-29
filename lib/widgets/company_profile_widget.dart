import 'package:finboard_app/entities/entities.dart';
import 'package:flutter/material.dart';

class CompanyProfileWidget extends StatelessWidget {
  final CompanyProfile companyProfile;

  const CompanyProfileWidget({Key key, @required this.companyProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    "https://logo.clearbit.com/${companyProfile.weburl.substring(12)}",
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      '${companyProfile.name} (${companyProfile.ticker})',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Row(
                  children: [
                    const Text('Website:'),
                    const SizedBox(width: 10,),
                    SelectableText(companyProfile.weburl)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('Exchange:'),
                    const SizedBox(width: 10,),
                    Expanded(child: Text(companyProfile.exchange)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('Market Cap:'),
                    const SizedBox(width: 10,),
                    Text('${companyProfile.marketCapitalization} millions ${companyProfile.currency}'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('Industry:'),
                    const SizedBox(width: 10,),
                    Text(companyProfile.finnhubIndustry),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('IPO date:'),
                    const SizedBox(width: 10,),
                    Text(companyProfile.ipo),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('Country:'),
                    const SizedBox(width: 10,),
                    Text(companyProfile.country),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text('Share Outstanding:'),
                    const SizedBox(width: 10,),
                    Text('${companyProfile.shareOutstanding.toString()} millions'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
