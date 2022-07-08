import 'package:app_pokedex/model/repositories/repository.dart';
import 'package:flutter/material.dart';

import '../model/json_pokedex.dart';

class PokemonPresenter with ChangeNotifier {
  final Repository repository;

  PokemonPresenter(this.repository);

  List<Pokedex> pokedexList = [];

  void getPokedex() async {
    pokedexList = await repository.getPokedex();
    notifyListeners();
  }
}
