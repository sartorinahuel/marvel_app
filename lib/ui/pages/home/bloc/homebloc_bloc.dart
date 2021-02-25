import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:marvel_app/domain/models/app_error.dart';
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
      try {
        seriesRepo.series.clear();
        await seriesRepo.getSeries(0);
        yield HomeDataState(seriesRepo.series);
      } on AppError catch (e) {
        yield HomeErrorState(e);
      }
    }

    if (event is HomeGetMoreSeriesEvent) {
      yield HomeLoadingMoreState();
      try {
        await seriesRepo.getSeries(event.offset);
        yield HomeDataState(seriesRepo.series);
      } on AppError catch (e) {
        yield HomeErrorState(e);
      }
    }
  }
}
