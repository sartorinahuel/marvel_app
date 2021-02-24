import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:marvel_app/domain/globals.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomePageBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomePageBloc() : super(HomeInitialState()) {
    add(HomeGetSeriesEvent());
  }

  @override
  Stream<HomeblocState> mapEventToState(HomeblocEvent event) async* {
    if (event is HomeGetSeriesEvent) {
      yield HomeLoadingState();
      seriesRepo.series.clear();
      await seriesRepo.getSeries(0);
      print(seriesRepo.series.length);
      yield HomeDataState(seriesRepo.series);
    }

    if (event is HomeGetMoreSeriesEvent) {
      yield HomeLoadingMoreState();
      await seriesRepo.getSeries(event.offset);
      yield HomeDataState(seriesRepo.series);
    }
  }
}
