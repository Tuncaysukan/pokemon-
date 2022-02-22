import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen(
      {Key? key,
      this.pokemonDetail,
      required this.color,
      required this.heroTag})
      : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var widht = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 01,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          Positioned(
            top: 80,
            left: 10,
            child: Text(
              widget.pokemonDetail['name'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            child: Text(widget.pokemonDetail['type'].join(',')),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: widht,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Name',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            widget.pokemonDetail['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Height',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            widget.pokemonDetail['height'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Weight',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            widget.pokemonDetail['weight'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Spaw Time',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            widget.pokemonDetail['spawn_time'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Weakness',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.pokemonDetail['weaknesses'].join(','),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Container(
                          width: widht * 0.3,
                          child: Text(
                            'Elvolution',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18),
                          ),
                        ),
                        widget.pokemonDetail['next_evolution'] != null
                            ? SizedBox(
                                height: 20,
                                width: widht * 0.55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget
                                      .pokemonDetail['next_evolution'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        widget.pokemonDetail['next_evolution']
                                            [index]['name'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Text('Max Out'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: height * 0.18,
              right: -10,
              child: Image.asset(
                'images/pokemon.png',
                height: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
              top: 180,
              left: (widht / 2) - 100,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              )),
        ],
      ),
    );
  }
}
