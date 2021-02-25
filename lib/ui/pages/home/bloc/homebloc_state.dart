part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

class HomeInitialState extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadingMoreState extends HomeblocState {}

class HomeDataState extends HomeblocState {
  final dynamic data;

  HomeDataState(this.data);
}

class HomeErrorState extends HomeblocState {
  final AppError appError;

  HomeErrorState(this.appError);
}
