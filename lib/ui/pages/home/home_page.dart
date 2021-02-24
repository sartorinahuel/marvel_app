import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/ui/pages/home/bloc/homebloc_bloc.dart';
import 'package:marvel_app/ui/pages/home/drawer.dart';
import 'package:marvel_app/ui/pages/home/widgets/series_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Marvel App',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        drawer: AppDrawer(),
        body: HomeGridView(),
      ),
    );
  }
}
