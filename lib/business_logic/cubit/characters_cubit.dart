import 'package:bloc/bloc.dart';
import 'package:bloc_breaking_bad/data/Model/characters.dart';
import 'package:bloc_breaking_bad/data/Model/quote.dart';
import 'package:bloc_breaking_bad/data/repository/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getAllQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
