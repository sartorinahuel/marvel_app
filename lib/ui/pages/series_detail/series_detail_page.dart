import 'package:flutter/material.dart';

import 'package:marvel_app/domain/models/serie.dart';

class SeriesDetailPage extends StatelessWidget {
  final Serie serie;

  const SeriesDetailPage({Key key, this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serie.title),
      ),
      body: Center(
        child: Text(serie.creators.items[0].name),
      ),
    );
  }
}
