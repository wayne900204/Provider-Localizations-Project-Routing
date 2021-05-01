import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_localizations.dart';
import '../locale_pro.dart';
import '../manager/route_manager.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: MaterialButton(
          onPressed: () {
            var model = Provider.of<LocalePro>(context, listen: false);
            Navigator.of(context).pushReplacementNamed(RouteName.splash);
            model.switchLocale(1);
          },
          child: Text(AppLocalizations.of(context).translate('name')),
        ),
      ),
    );
  }
}
