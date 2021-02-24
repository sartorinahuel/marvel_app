import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).support),
      ),
      body: Center(
        child: Container(
          child: Text(AppLocalizations.of(context).support),
        ),
      ),
    );
  }
}
