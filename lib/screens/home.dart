import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:pokesearcher/screens/pokedetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

//https://pokeapi.co/api/v2/pokemon/
// https://pokeapi.co/api/v2/pokemon
class _MyWidgetState extends State<Home> {
  Future<dynamic> getPokemon(name) async {
    // https://www.fruityvice.com/api/fruit/all
    var url = Uri.https('pokeapi.co', '/api/v2/pokemon/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      print(data);
      return data;
    }
    throw Exception('Failed to load Pokemon');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPokemon(null),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Card(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: snapshot.data['results'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            selected: true,
                            contentPadding: EdgeInsets.all(5),
                            selectedTileColor:
                                Color.fromARGB(255, 34, 136, 104),
                            leading: Icon(
                              Icons.cruelty_free,
                              color: Colors.white,
                            ),
                            title: Text(
                              snapshot.data['results'][index]['name']
                                  .toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              showpokemon(
                                  context,
                                  snapshot.data['results'][index]['name'],
                                  index);
                              print((snapshot.data['results'][index]));
                            },
                          ));
                    }),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
