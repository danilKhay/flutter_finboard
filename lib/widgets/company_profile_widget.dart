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
                    //"https://logo.clearbit.com/${cp.webUrl.substring(12)}",
                    cp.logoUrl,
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        cp.name,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText('Website:   ${cp.webUrl}'),
                    _buildText('Exchange:   ${cp.exchange}'),
                    _buildText('Market Cap:   ${cp.marketCap}'),
                    _buildText('Industry:   ${cp.industry}'),
                    _buildText('IPO date:   ${cp.ipoDate}'),
                    _buildText('Country:   ${cp.country}'),
                    _buildText('Share Outstanding:   ${cp.share}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildText(String text) => Expanded(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SelectableText(
            text,
          ),
          alignment: Alignment.centerLeft,
        ),
      );

}
