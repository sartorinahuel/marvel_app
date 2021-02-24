import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  AppLocalizations.of(context).settings,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('settings');
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.help_outlined),
                title: Text(AppLocalizations.of(context).support),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('support');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
