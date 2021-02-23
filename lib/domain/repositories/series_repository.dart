import '../models/serie.dart';

abstract class SeriesRepository {
  List<Serie> series = [];

  Future<List<Serie>> getSeries(int offset);
}
