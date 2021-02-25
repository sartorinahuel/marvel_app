import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import 'package:marvel_app/domain/globals.dart';
import 'package:marvel_app/ui/pages/home/widgets/series_grid_item.dart';
import 'package:marvel_app/ui/widgets/error_page.dart';
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
            if (state is HomeErrorState) {
              return ErrorScreen(
                state.appError.code,
                state.appError.message,
              );
            }
            if (state is HomeDataState || state is HomeLoadingMoreState) {
              return SingleChildScrollView(
                controller: controller,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Series', style: Theme.of(context).textTheme.headline1),
                    SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size.width > 400 ? 3 : 2),
                      itemCount: seriesRepo.series.length,
                      itemBuilder: (context, index) {
                        return SlideInUp(
                          delay: Duration(milliseconds: 100 + 50 * index),
                          duration: Duration(milliseconds: 300),
                          from: 200,
                          child: SeriesGridItemContainer(serie: seriesRepo.series[index]),
                        );
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
