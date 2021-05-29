import 'package:finboard_app/screens/home_screen.dart';
import 'package:finboard_app/stores/app_viewmodel.dart';
import 'package:finboard_app/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../utils/finboard_logo_icons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);
  static const routeName = '/';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textController = TextEditingController();
  List<ReactionDisposer> _disposers;
  AppViewModel _appViewModel;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void dispose() {
    textController.dispose();
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appViewModel ??= Provider.of<AppViewModel>(context);
    _disposers ??= [
      reaction(
        // Tell the reaction which observable to observe
        (_) => _appViewModel.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
      reaction(
        // Tell the reaction which observable to observe
        (_) => _appViewModel.tickerState,
        // Run some logic with the content of the observed field
        (TickerState state) {
          if (state == TickerState.success) {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                FinboardLogo.finboardLogo,
                size: 200,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                keyboardType: TextInputType.text,
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Company Ticker',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Observer(
                builder: (_) {
                  switch (_appViewModel.tickerState) {
                    case TickerState.loading: {
                      return Loading();
                    }
                    default: {
                      return OutlinedButton(
                        onPressed: () {
                          _appViewModel.getTicker(textController.text);
                        },
                        child: Text(
                          'Analyze',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    }
                  }
                },
              ),
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
