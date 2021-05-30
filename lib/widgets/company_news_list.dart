import 'package:finboard_app/entities/company_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: Text('Last News', style: Theme.of(context).textTheme.headline6,),
        ),
        Divider(),
        if (list.isEmpty)
          Expanded(child: Center(child: Text('No news for the last 7 days.'),)),
        if (list.isNotEmpty)
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  return buildListItem(item);
                },
              ),
            ),
          ),
      ],
    );
  }

  Card buildListItem(CompanyNews item) {
    return Card(
      color: Colors.grey.shade900,
      margin: EdgeInsets.all(4),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          title: Text(item.headline),
          subtitle: Text(item.summary, maxLines: 7, overflow: TextOverflow.ellipsis,),
          onTap: () => _launchURL(item.url),
        ));
  }

  void _launchURL(String url) async =>
       await canLaunch(url) ? await launch(url) : throw 'Can\'t launch url: $url';
}
