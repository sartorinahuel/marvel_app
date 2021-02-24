import 'package:flutter/material.dart';

import 'package:marvel_app/domain/models/serie.dart';

class BuildAppBar extends StatelessWidget {
  final Serie serie;
  final UniqueKey tagKey;

  const BuildAppBar(this.serie, this.tagKey);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          color: Colors.black54,
          child: Text(
            serie.title,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        background: Hero(
          tag: tagKey,
          child: FadeInImage(
            image: NetworkImage(serie.thumbnail.path + '.' + serie.thumbnail.fileExtension),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fadeInDuration: Duration(microseconds: 150),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
