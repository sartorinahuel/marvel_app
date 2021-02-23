import 'package:flutter/material.dart';

import 'ui/pages/home/home_page.dart';
import 'ui/pages/settings/settings_page.dart';
import 'ui/pages/support/support_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        'settings': (context) => SettingsPage(),
        'support': (context) => SupportPage(),
      },
    );
  }
}
