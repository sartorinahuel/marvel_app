import 'package:marvel_app/data/implementations/creators_impl.dart';
import 'package:marvel_app/data/implementations/series_impl.dart';
import 'package:marvel_app/domain/repositories/creators_repository.dart';
import 'package:marvel_app/domain/repositories/series_repository.dart';

import 'package:marvel_app/data/services/http_http_service.dart';
import 'package:marvel_app/domain/services/http_service.dart';

//Dependencies
final HttpService httpService = HttpHttpService();
final SeriesRepository seriesRepo = SeriesImplementation();
final CreatorsRepository creatorsRepo = CreatorsImplementation();
