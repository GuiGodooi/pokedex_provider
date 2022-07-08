import 'dart:convert';
import 'package:app_pokedex/presenter/pokemon_presenter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/json_pokedex.dart';
import 'package:app_pokedex/model/repositories/repository.dart';
import 'package:app_pokedex/presenter/pokemon_presenter.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late PokemonPresenter presenter;

  @override
  void initState() {
    presenter = context.read<PokemonPresenter>();
    presenter.getPokedex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text(
          'Pokedex',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.network(
              'https://cdn.pixabay.com/photo/2016/09/01/09/31/pokemon-1635610_1280.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Consumer<PokemonPresenter>(builder: (_, p, w) {
            return ListView.builder(
              itemCount: presenter.pokedexList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/itens',
                          arguments: presenter.pokedexList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Image.network(
                              presenter.pokedexList[index].thumbnailImage ?? '',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              presenter.pokedexList[index].name ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            '#${presenter.pokedexList[index].number ?? ''}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
