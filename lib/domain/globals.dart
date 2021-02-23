import '../data/implementations/character_impl.dart';
import '../data/services/http_http_service.dart';
import 'services/http_service.dart';
import 'repositories/character_repository.dart';

//Dependencies
final HttpService httpService = HttpHttpService();
final CharacterRepository charRepo = CharacterImplementation();
