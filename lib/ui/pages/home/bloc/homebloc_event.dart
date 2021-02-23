part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeGetSeriesEvent extends HomeblocEvent {}

class HomeGetMoreSeriesEvent extends HomeblocEvent {
  final int offset;

  HomeGetMoreSeriesEvent(this.offset);
}
