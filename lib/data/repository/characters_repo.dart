import 'package:bloc_breaking_bad/data/Model/characters.dart';
import 'package:bloc_breaking_bad/data/Model/quote.dart';
import 'package:bloc_breaking_bad/data/WebServices/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServices.getAllQuotes(charName);
    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
