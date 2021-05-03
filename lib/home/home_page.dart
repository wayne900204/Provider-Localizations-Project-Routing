import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/home/home_pro.dart';
import 'package:provider_study/home/tap_to_top_pro.dart';
import 'package:provider_study/location/provider/locale_pro.dart';

import '../location/app_localizations.dart';

class HomePage extends StatelessWidget {
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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   TapToTopPro tapToTopPro;
//   HomePro homePro;
//
//   @override
//   void initState() {
//       tapToTopPro = TapToTopPro();
//       homePro = HomePro();
//       homePro.initData();
//       tapToTopPro.init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<TapToTopPro>.value(value: tapToTopPro),
//           ChangeNotifierProvider<HomePro>.value(value: homePro),
//         ],
//         child: Consumer2<A, B>(
//           builder: widget.builder,
//           child: widget.child,
//         )
//     );
//   }
// }
//
