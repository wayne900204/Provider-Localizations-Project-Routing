import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_localizations.dart';
import '../locale_pro.dart';
import '../manager/route_manager.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).translate('name')),
            Text(AppLocalizations.of(context).translate('name')),
            Text(AppLocalizations.of(context).translate('name')),
            MaterialButton(
              onPressed: () {
                var model = Provider.of<LocalePro>(context, listen: false);
                model.switchLocale(1);
              },
              child: Text("改成中文"),
            ),
            MaterialButton(
              onPressed: () {
                var model = Provider.of<LocalePro>(context, listen: false);
                model.switchLocale(0);
              },
              child: Text("改成英文"),
            ),
          ],
        ),
      ),
    );
  }
}
