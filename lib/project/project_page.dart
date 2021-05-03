import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/location/provider/locale_pro.dart';

import '../location/app_localizations.dart';
import '../main_manager/route_manager.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context).translate('name')),
            Text(AppLocalizations.of(context).translate('name')),
            Text(AppLocalizations.of(context).translate('name')),
            MaterialButton(
              onPressed: () {
                var model = Provider.of<LocalePro>(context, listen: false);
                Navigator.of(context)
                    .pushReplacementNamed(RouteName.homeSecondFloor);
                model.switchLocale(0);
              },
              child: Text(AppLocalizations.of(context).translate('name')),
            ),
          ],
        ),
      ),
    );
  }
}
