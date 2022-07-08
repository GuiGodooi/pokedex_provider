import 'package:flutter/material.dart';
import '../model/json_pokedex.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Pokedex detalhes = ModalRoute.of(context)!.settings.arguments as Pokedex;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(detalhes.name ?? ''),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Cards(),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokedex detalhes = ModalRoute.of(context)!.settings.arguments as Pokedex;

    return Padding(
      padding: const EdgeInsets.only(
        top: 0.4,
        left: 6,
        right: 2,
      ),
      child: Card(
        elevation: 200,
        margin: const EdgeInsets.only(
          top: 6,
          left: 10,
          right: 10,
          bottom: 2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 187, 24, 24),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '#${detalhes.number}',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Image.network(
                      '${detalhes.thumbnailImage}',
                      width: 300,
                      height: 300,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('${detalhes.description}' ''),
              const SizedBox(height: 20),
              const Text(
                'Tipo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${detalhes.type}',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fraquezas:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${detalhes.weakness}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
