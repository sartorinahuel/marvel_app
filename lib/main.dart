import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/theme/theme.dart';
import 'ui/pages/series_detail/series_detail_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/settings/settings_page.dart';
import 'ui/pages/support/support_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
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
