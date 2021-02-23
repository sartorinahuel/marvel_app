part of 'seriesdetail_bloc.dart';

@immutable
abstract class SeriesdetailEvent {}

class SeriesGetCreatorEvent extends SeriesdetailEvent {
  final String creatorId;

  SeriesGetCreatorEvent(this.creatorId);
}
