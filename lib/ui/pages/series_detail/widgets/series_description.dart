import 'package:flutter/material.dart';

import 'package:marvel_app/domain/models/serie.dart';

class Description extends StatelessWidget {
  final Serie serie;

  const Description(this.serie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        serie.description ?? 'Sin descripción',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
