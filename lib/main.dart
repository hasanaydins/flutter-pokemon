import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pokemmon_detay2.dart';
import 'package:flutter_pokemon/pokemon_list.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Pokemons',
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        accentColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PokemonList();
  }
}
