import 'package:app_pokedex/model/repositories/repository.dart';
import 'package:app_pokedex/presenter/pokemon_presenter.dart';
import 'package:app_pokedex/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_pokedex/view/pokemon_descrip.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PokemonPresenter(Repository()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
      routes: {
        '/home': (context) => const TelaPrincipal(),
        '/itens': (context) => const Description(),
      },
    );
  }
}
