// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Pokedex {
  List<Pokemon> pokemon;

  Pokedex({
    @required this.pokemon,
  });

  factory Pokedex.fromJson(String str) => Pokedex.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokedex.fromMap(Map<String, dynamic> json) => Pokedex(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toMap())),
      };
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;

  Pokemon({
    @required this.id,
    @required this.num,
    @required this.name,
    @required this.img,
    @required this.type,
    @required this.height,
    @required this.weight,
    @required this.candy,
    @required this.candyCount,
    @required this.egg,
    @required this.spawnChance,
    @required this.avgSpawns,
    @required this.spawnTime,
    @required this.multipliers,
    @required this.weaknesses,
    @required this.nextEvolution,
    @required this.prevEvolution,
  });

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null
            ? null
            : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: json["next_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["next_evolution"].map((x) => Evolution.fromMap(x))),
        prevEvolution: json["prev_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["prev_evolution"].map((x) => Evolution.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount == null ? null : candyCount,
        "egg": egg,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null
            ? null
            : List<dynamic>.from(multipliers.map((x) => x)),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
        "next_evolution": nextEvolution == null
            ? null
            : List<dynamic>.from(nextEvolution.map((x) => x.toMap())),
        "prev_evolution": prevEvolution == null
            ? null
            : List<dynamic>.from(prevEvolution.map((x) => x.toMap())),
      };
}

class Evolution {
  String num;
  String name;

  Evolution({
    @required this.num,
    @required this.name,
  });

  factory Evolution.fromJson(String str) => Evolution.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evolution.fromMap(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "num": num,
        "name": name,
      };
}
