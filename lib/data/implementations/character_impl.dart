import '../../domain/globals.dart';
import '../../domain/models/app_error.dart';
import '../../domain/models/character.dart';
import '../../domain/models/charaters_response.dart';
import '../../domain/repositories/character_repository.dart';

class CharacterImplementation extends CharacterRepository {
  List<Character> characters = [];

  @override
  Future<Character> getCharacterById(int id) async {
    try {
      if (characters.isEmpty) {
        await getCharacters();
      }
      final char = characters.firstWhere((e) => e.id == id);
      return char;
    } on FormatException catch (e) {
      throw AppError(code: 'format-exception', message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      throw AppError(code: 'generic-error', message: 'An error occur');
    }
  }

  @override
  Future<List<Character>> getCharacters() async {
    try {
      final response = await httpService.getMethod('/characters', '&limit=50');
      final charResponse = CharactersResponse.fromJson(response);

      characters.clear();
      characters = charResponse.data.results;
      return characters;
    } on FormatException catch (e) {
      throw AppError(code: 'format-exception', message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      throw AppError(code: 'generic-error', message: 'An error occur');
    }
  }

  @override
  Future<List<Character>> getCharacterByName(String name) async {
    try {
      final response = await httpService.getMethod('/characters', '&nameStartsWith=$name');
      final charResponse = CharactersResponse.fromJson(response);
      return charResponse.data.results;
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
