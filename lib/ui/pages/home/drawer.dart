import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SafeArea(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('settings');
                },
                child: Text('Settings'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('support');
                },
                child: Text('Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
