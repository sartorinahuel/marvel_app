import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/domain/globals.dart';
import 'package:marvel_app/domain/models/serie.dart';
import 'package:marvel_app/ui/pages/home/bloc/homebloc_bloc.dart';

class HomeGridView extends StatefulWidget {
  @override
  _HomeGridViewState createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  ScrollController controller;
  HomePageBloc _homePageBloc;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _homePageBloc = BlocProvider.of<HomePageBloc>(context);
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter == 0) {
      controller.jumpTo(controller.position.maxScrollExtent - 1);
      offset += 20;
      _homePageBloc.add(HomeGetMoreSeriesEvent(offset));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: RefreshIndicator(
        key: UniqueKey(),
        onRefresh: () async {
          offset = 0;
          BlocProvider.of<HomePageBloc>(context).add(HomeGetSeriesEvent());
        },
        child: BlocBuilder<HomePageBloc, HomeblocState>(
          builder: (context, state) {
            print(offset);
            print(state.toString());
            if (state is HomeDataState || state is HomeLoadingMoreState) {
              return SingleChildScrollView(
                controller: controller,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size.width > 400 ? 3 : 2),
                      itemCount: seriesRepo.series.length,
                      itemBuilder: (context, index) {
                        return SeriesGridItemContainer(serie: seriesRepo.series[index]);
                      },
                    ),
                    if (state is HomeLoadingMoreState)
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

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
