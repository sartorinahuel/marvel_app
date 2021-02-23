import 'package:flutter/material.dart';
import 'package:marvel_app/ui/pages/home/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel App'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
