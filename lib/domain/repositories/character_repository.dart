import '../../domain/models/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
  Future<Character> getCharacterById(int id);
  Future<List<Character>> getCharacterByName(String name);
}
