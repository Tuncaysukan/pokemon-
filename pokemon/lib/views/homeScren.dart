import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/views/pokemonDetailScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List pokedex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -50,
          right: -50,
          child: Image.asset(
            'images/pokemon.png',
            fit: BoxFit.fitWidth,
            width: 200,
            height: 200,
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          child: Text(
            'Pokedex',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokedex.length != null
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: pokedex.length,
                        itemBuilder: (context, index) {
                          var type = pokedex[index]['type'][0];
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: type == 'Grass'
                                      ? Colors.greenAccent
                                      : type == 'Fire'
                                          ? Colors.red
                                          : type == 'Water'
                                              ? Colors.lightBlueAccent
                                              : type == 'Bug'
                                                  ? Colors.green
                                                  : type == 'Normal'
                                                      ? Colors.cyan
                                                      : type == 'Poison'
                                                          ? Colors.black26
                                                          : Colors
                                                              .deepOrangeAccent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: Image.asset(
                                        'images/pokemon.png',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Text(
                                        pokedex[index]['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                      left: 25,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 4,
                                              bottom: 4),
                                          child: Text(
                                            type.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CachedNetworkImage(
                                        imageUrl: pokedex[index]['img'],
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              //Detail Page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PokemonDetailScreen(
                                        pokemonDetail: pokedex[index],
                                        color: type == 'Grass'
                                            ? Colors.greenAccent
                                            : type == 'Fire'
                                            ? Colors.red
                                            : type == 'Water'
                                            ? Colors.lightBlueAccent
                                            : type == 'Bug'
                                            ? Colors.green
                                            : type == 'Normal'
                                            ? Colors.cyan
                                            : type == 'Poison'
                                            ? Colors.black26
                                            : Colors
                                            .deepOrangeAccent,
                                        heroTag: index,
                                      )));
                            },
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ],
    ));
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        'Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsondata = jsonDecode(value.body);
        pokedex = decodedJsondata['pokemon'];

        setState(() {});
      } else {
        print('Hatalı işlem ');
      }
    });
  }
}
