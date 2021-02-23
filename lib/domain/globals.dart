import 'package:marvel_app/data/implementations/series_impl.dart';
import 'package:marvel_app/domain/repositories/series_repository.dart';

import 'package:marvel_app/data/services/http_http_service.dart';
import 'package:marvel_app/domain/services/http_service.dart';

import 'package:marvel_app/data/implementations/character_impl.dart';
import 'package:marvel_app/domain/repositories/character_repository.dart';

//Dependencies
final HttpService httpService = HttpHttpService();
final CharacterRepository charRepo = CharacterImplementation();
final SeriesRepository seriesRepo = SeriesImplementation();
