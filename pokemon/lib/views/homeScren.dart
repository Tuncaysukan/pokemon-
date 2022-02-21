import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
        body: Column(
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
                    var type =pokedex[index]['type'];
                    return Card(
                      color: Colors.green,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom:-10,
                            right: -10,
                            child: Image.asset(
                              'images/pokemon.png',
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Column(
                            children: [
                              Positioned(
                                top:30,
                                left: 20,
                                child: Text(pokedex[index]['name']),
                              ),
                              Positioned(
                                top:45,
                                left: 20,
                                child: Text( type.toString(),),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Expanded(
                                  child: CachedNetworkImage(
                                      imageUrl: pokedex[index]['img']),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              )
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
