import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/domain/models/serie.dart';
import 'package:marvel_app/ui/pages/series_detail/bloc/seriesdetail_bloc.dart';
import 'package:marvel_app/ui/pages/series_detail/widgets/app_bar.dart';
import 'package:marvel_app/ui/pages/series_detail/widgets/creators_list.dart';
import 'package:marvel_app/ui/pages/series_detail/widgets/series_description.dart';
import 'package:marvel_app/ui/widgets/error_page.dart';

class SeriesDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;
    final Serie serie = args[0];
    final UniqueKey tagKey = args[1];

    return BlocProvider(
      create: (context) => SeriesdetailBloc(),
      child: BlocBuilder<SeriesdetailBloc, SeriesdetailState>(
        builder: (context, state) {
          // error screen
          if (state is SeriesErrorState) {
            return ErrorScreen(
              state.appError.code,
              state.appError.message,
            );
          }

          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                BuildAppBar(serie, tagKey),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 10.0),
                    Description(serie),
                    Creators(serie),
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
