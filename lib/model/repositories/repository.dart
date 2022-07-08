import 'dart:convert';
import 'package:app_pokedex/model/json_pokedex.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<Pokedex>> getPokedex() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    List<Pokedex> pokedexList = [];

    final resultado = await http.get(url);

    if (resultado.statusCode == 200) {
      Map json = const JsonDecoder().convert(resultado.body);

      for (var element in (json['data'] as List)) {
        pokedexList.add(Pokedex.fromJson(element));
      }
      return pokedexList;
    }

    return pokedexList;
  }
}
