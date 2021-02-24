import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/domain/models/creator.dart';

import 'package:marvel_app/domain/models/serie.dart';
import 'package:marvel_app/ui/pages/series_detail/bloc/seriesdetail_bloc.dart';

class SeriesDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;
    final Serie serie = args[0];
    final UniqueKey tagKey = args[1];

    return BlocProvider(
      create: (context) => SeriesdetailBloc(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _BuildAppBar(serie, tagKey),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10.0),
                _Description(serie),
                _Creators(serie),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final Serie serie;

  const _Description(this.serie);

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

class _BuildAppBar extends StatelessWidget {
  final Serie serie;
  final UniqueKey tagKey;

  const _BuildAppBar(this.serie, this.tagKey);
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
        title: Text(
          serie.title,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
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

class _Creators extends StatelessWidget {
  final Serie serie;

  const _Creators(this.serie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: serie.creators.items.length,
        itemBuilder: (BuildContext context, int index) => _CreatorItem(
          serie.creators.items[index].resourceUri,
          serie.creators.items[index].name,
          serie.creators.items[index].role,
        ),
      ),
    );
  }
}

class _CreatorItem extends StatefulWidget {
  final String creatorId;
  final String name;
  final String role;

  const _CreatorItem(this.creatorId, this.name, this.role);

  @override
  __CreatorItemState createState() => __CreatorItemState();
}

class __CreatorItemState extends State<_CreatorItem> {
  SeriesdetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SeriesdetailBloc();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(SeriesGetCreatorEvent(widget.creatorId));

    return BlocBuilder<SeriesdetailBloc, SeriesdetailState>(
      cubit: _bloc,
      builder: (context, state) {
        Widget avatar;
        if (state is SeriesCreatorsDataState) {
          avatar = CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(state.creator.thumbnail.path + '.' + state.creator.thumbnail.fileExtension),
          );
        } else {
          avatar = CircularProgressIndicator();
        }
        return Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          color: Colors.grey,
          child: Row(
            children: [
              avatar,
              SizedBox(width: 15),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              Text(
                widget.role,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}
