import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/domain/globals.dart';
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
    if (controller.position.extentAfter < 5) {
      offset += 20;
      _homePageBloc.add(HomeGetMoreSeriesEvent(offset));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomeblocState>(
      builder: (context, state) {
        if (state is HomeDataState || state is HomeLoadingMoreState) {
          return Container(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: seriesRepo.series.length,
                    itemBuilder: (context, index) {
                      return Container(child: Text(seriesRepo.series[index].title));
                    },
                  ),
                  if (state is HomeLoadingMoreState)
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
