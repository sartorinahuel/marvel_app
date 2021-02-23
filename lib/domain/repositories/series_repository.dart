import '../models/serie.dart';

abstract class SeriesRepository {
  Future<List<Serie>> getSeries();
}
