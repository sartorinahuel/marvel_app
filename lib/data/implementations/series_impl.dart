import 'package:marvel_app/domain/globals.dart';
import 'package:marvel_app/domain/models/app_error.dart';
import 'package:marvel_app/domain/models/serie.dart';
import 'package:marvel_app/domain/models/series_response.dart';
import 'package:marvel_app/domain/repositories/series_repository.dart';

class SeriesImplementation extends SeriesRepository {
  @override
  Future<List<Serie>> getSeries(int offset) async {
    try {
      final response = await httpService.getMethod('/series', '&offset=$offset');
      final seriesResponse = SeriesResponse.fromJson(response);

      series.addAll(seriesResponse.data.results);
      return series;
    } on FormatException catch (e) {
      throw AppError(code: 'format-exception', message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      throw AppError(code: 'generic-error', message: 'An error occur');
    }
  }
}
