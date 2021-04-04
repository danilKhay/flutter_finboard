import 'package:finboard_app/models/company_profile_model.dart';
import 'package:flutter/material.dart';

class CompanyProfileWidget extends StatelessWidget {
  final CompanyProfileModel cp;

  const CompanyProfileWidget({Key key, @required this.cp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    "https://logo.clearbit.com/${cp.webUrl.substring(12)}",
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      cp.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Website:'),
                  const SizedBox(width: 10,),
                  SelectableText(cp.webUrl)
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Exchange:'),
                  const SizedBox(width: 10,),
                  Expanded(child: Text(cp.exchange)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Market Cap:'),
                  const SizedBox(width: 10,),
                  Text(cp.marketCap),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Industry:'),
                  const SizedBox(width: 10,),
                  Text(cp.industry),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('IPO date:'),
                  const SizedBox(width: 10,),
                  Text(cp.ipoDate),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Country:'),
                  const SizedBox(width: 10,),
                  Text(cp.country),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Text('Share Outstanding:'),
                  const SizedBox(width: 10,),
                  Text(cp.share),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
