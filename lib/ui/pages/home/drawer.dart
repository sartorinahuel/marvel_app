import 'package:flutter/material.dart';

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
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('settings');
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.help_outlined),
                title: Text('Support'),
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
