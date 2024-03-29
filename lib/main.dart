import 'package:flutter/material.dart';
import 'package:pokesearcher/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PokeList', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 116, 180, 118),
        ),
        body: Home(),
      ),
    ),
  );
}
