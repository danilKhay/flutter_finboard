import 'package:flutter/material.dart';

class MaterialErrorWidget extends StatelessWidget {
  final Function onRefresh;

  const MaterialErrorWidget({
    Key key, @required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 50,),
          SizedBox(height: 10,),
          Text('Error. Try Again.'),
          SizedBox(height: 10,),
          OutlinedButton(onPressed: onRefresh, child: Text('Refresh')),
        ],
      ),
    );
  }
}