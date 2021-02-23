part of 'seriesdetail_bloc.dart';

@immutable
abstract class SeriesdetailState {}

class SeriesdetailInitial extends SeriesdetailState {}

class SeriesLoadingImageState extends SeriesdetailState {}

class SeriesCreatorsDataState extends SeriesdetailState {
  final Creator creator;

  SeriesCreatorsDataState(this.creator);
}
