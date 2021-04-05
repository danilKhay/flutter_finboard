import 'package:finboard_app/entities/company_news.dart';
import 'package:flutter/material.dart';

class CompanyNewsListWidget extends StatefulWidget {
  final List<CompanyNews> companyNewsList;

  const CompanyNewsListWidget({Key key, this.companyNewsList})
      : super(key: key);

  @override
  _CompanyNewsListWidgetState createState() => _CompanyNewsListWidgetState();
}

class _CompanyNewsListWidgetState extends State<CompanyNewsListWidget> {
  @override
  Widget build(BuildContext context) {
    final list = widget.companyNewsList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('Last News', style: Theme.of(context).textTheme.headline5,),
        ),
        Divider(),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return Card(child: ListTile(title: Text(item.headline), subtitle: Text(item.summary),));
              },
            ),
          ),
        ),
      ],
    );
  }
}
