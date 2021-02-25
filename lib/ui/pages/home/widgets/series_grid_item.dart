import 'package:flutter/material.dart';

import 'package:marvel_app/domain/models/serie.dart';

class SeriesGridItemContainer extends StatelessWidget {
  final Serie serie;

  const SeriesGridItemContainer({this.serie});

  @override
  Widget build(BuildContext context) {
    final tagKey = UniqueKey();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('series-detail', arguments: [serie, tagKey]);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Hero(
                tag: tagKey,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(serie.thumbnail.path + '.' + serie.thumbnail.fileExtension),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              child: Text(
                serie.title,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
