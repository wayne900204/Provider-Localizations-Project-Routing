import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/manager/route_manager.dart';
import 'package:provider_study/manager/storage_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'app_localizations.dart';
import 'locale_pro.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalePro>(
          create: (context) => new LocalePro(),
        ),
      ],
      child: Consumer<LocalePro>(builder: (context, localeModel, child) {
        return RefreshConfiguration(
            hideFooterWhenNotFull: true, //列表數據不满一頁,不觸發加載更多
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.cyan),
              locale: localeModel.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                RefreshLocalizations.delegate, //下拉刷新
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              // 支援的 languageCode
              supportedLocales: AppLocalizations.delegate.supportedLocales,
              onGenerateRoute: MyRouter.generateRoute,
              initialRoute: RouteName.splash,
            ));
      }),
    );
  }
}
