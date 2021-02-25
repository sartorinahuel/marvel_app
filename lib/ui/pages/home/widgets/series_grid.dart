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
  //controller is used to detect the scroll´s end and get 20 more items.
  ScrollController controller;
  HomePageBloc _homePageBloc;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _homePageBloc = BlocProvider.of<HomePageBloc>(context);
    //This listener has the scroll value.
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    //Dispose to better memory management
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter == 0) {
      // if condition true we move scroll position 1 pixel to avoid loop.
      controller.jumpTo(controller.position.maxScrollExtent - 1);
      // this offset is the number of the initial position in the list.
      offset += 20;
      // get next 20 items
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
          // reload just the first 20 items
          BlocProvider.of<HomePageBloc>(context).add(HomeGetSeriesEvent());
        },
        child: BlocBuilder<HomePageBloc, HomeblocState>(
          builder: (context, state) {
            // error screen
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

                    // items grid view
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

                    //loading spinner
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
