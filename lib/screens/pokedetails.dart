import 'package:flutter/material.dart';

void showpokemon(BuildContext context, String name, int id) {
  showDialog(
    context: context,
    builder: (context) {
      // print('jello');
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(5),
          height: 300,
          width: 300,
          child: Column(
            children: [
              Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${id}.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              )
            ],
          ),
        ),
      );
    },
  );
}
//          
