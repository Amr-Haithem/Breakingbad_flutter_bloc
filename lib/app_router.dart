import 'package:bloc_breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_breaking_bad/constants/strings.dart';
import 'package:bloc_breaking_bad/data/WebServices/characters_web_services.dart';
import 'package:bloc_breaking_bad/data/repository/characters_repo.dart';
import 'package:bloc_breaking_bad/presentation/screens/characters_details_screen.dart';
import 'package:bloc_breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/Model/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext cxt) => charactersCubit,
                  child: CharacterScreen(),
                ));
      case characterDetailScreenRoute:
        //creates a settings.argument as a specific object to pass it
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext cxt) => CharactersCubit(charactersRepository),
            child: CharacterDetailScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
