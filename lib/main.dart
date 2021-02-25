import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/theme/theme.dart';
import 'ui/pages/series_detail/series_detail_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/settings/settings_page.dart';
import 'ui/pages/support/support_page.dart';

// The app is separated into three folders: Data, Domain and Ui.
// Domain contains the contracts to be followed by the implementations, the classes and the service contracts.
// The Data folder contains the implementations of these contracts and in the UI it has all the screens and widgets.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      home: HomePage(),
      routes: {
        'settings': (context) => SettingsPage(),
        'support': (context) => SupportPage(),
        'series-detail': (context) => SeriesDetailPage(),
      },
    );
  }
}
