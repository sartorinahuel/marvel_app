import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/ui/pages/home/bloc/homebloc_bloc.dart';
import 'package:marvel_app/ui/pages/home/drawer.dart';
import 'package:marvel_app/ui/pages/home/widgets/series_grid.dart';
import 'package:marvel_app/ui/pages/search/series_search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            'Marvel App',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: <Widget>[
            //Search Button
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SeriesSearch(),
                );
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: HomeGridView(),
      ),
    );
  }
}
