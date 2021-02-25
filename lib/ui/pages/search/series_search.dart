import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marvel_app/domain/globals.dart';
import 'package:marvel_app/domain/models/serie.dart';
import 'package:marvel_app/ui/theme/theme.dart';

class SeriesSearch extends SearchDelegate {
  String seleccion = '';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: AppTheme.marvelRed,
      primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(color: Colors.grey),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppTheme.marvelGrey,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: AppTheme.marvelGrey,
        fontFamily: 'Montserrat',
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return _results(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.length < 3) {
      return Container();
    }
    return _results(query);
  }

  Widget _results(String query) {
    return FutureBuilder(
      future: seriesRepo.searchSeries(query),
      builder: (BuildContext context, AsyncSnapshot<List<Serie>> snapshot) {
        if (snapshot.hasData) {
          final series = snapshot.data;

          return Container(
            color: Colors.grey[800],
            child: snapshot.data.length > 0
                ? ListView(
                    children: series.map((serie) {
                    final tagKey = UniqueKey();
                    return ListTile(
                      leading: FadeInImage(
                        image: NetworkImage(serie.thumbnail.path + '.' + serie.thumbnail.fileExtension),
                        placeholder: AssetImage('assets/imgs/no-image.jpg'),
                        width: 50.0,
                        fit: BoxFit.contain,
                      ),
                      title: Text(serie.title),
                      onTap: () {
                        close(context, null);
                        Navigator.pushNamed(context, 'series-detail', arguments: [
                          serie,
                          tagKey,
                        ]);
                        print(serie.title);
                      },
                    );
                  }).toList())
                : Center(
                    child: Text(
                      AppLocalizations.of(context).noResults,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
