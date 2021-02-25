import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:marvel_app/domain/globals.dart';
import 'package:marvel_app/domain/models/app_error.dart';
import 'package:marvel_app/domain/models/creator.dart';
import 'package:meta/meta.dart';

part 'seriesdetail_event.dart';
part 'seriesdetail_state.dart';

class SeriesdetailBloc extends Bloc<SeriesdetailEvent, SeriesdetailState> {
  SeriesdetailBloc() : super(SeriesdetailInitial());

  @override
  Stream<SeriesdetailState> mapEventToState(SeriesdetailEvent event) async* {
    if (event is SeriesGetCreatorEvent) {
      yield SeriesLoadingImageState();
      try {
        Creator creator = await creatorsRepo.getCreatorById(event.creatorId);
        yield SeriesCreatorsDataState(creator);
      } on AppError catch (e) {
        yield SeriesErrorState(e);
      }
    }
  }
}
