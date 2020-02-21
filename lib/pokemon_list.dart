import 'package:flutter/material.dart';
import 'package:flutter_pokemon/models/Pokedex.dart';
import 'package:flutter_pokemon/pokemmon_detay2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'models/Pokedex.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList>
    with SingleTickerProviderStateMixin {
  Pokedex pokedex;
  Future<Pokedex> veri;
  PaletteGenerator paletteGenerator;
  Color baskinRenk;

  Future<Pokedex> _pokemonGetir() async {
    String url =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

    var response = await http.get(url);
    var decodedJson = json.decode(response.body);

    pokedex = Pokedex.fromMap(decodedJson);

    return pokedex;
  }

  List colors = [Colors.red, Colors.green, Colors.yellow];
  Random random = new Random();

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = random.nextInt(3);
    veri = _pokemonGetir();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
        backgroundColor: Colors.indigoAccent,
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, ScreenUtil().setWidth(400)),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize:
                Size(ScreenUtil().setWidth(200), ScreenUtil().setWidth(300)),
            child: Container(
                height: ScreenUtil().setWidth(250),
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setWidth(100),
                      right: ScreenUtil().setWidth(500)),
                  child: Text(
                    "Pokedex",
                    style: TextStyle(
                        fontSize: ScreenUtil().setWidth(100),
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
/*          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 29,
                )
              ],
            ),
          ),*/
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(111)),
            child: Image(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              colorBlendMode: BlendMode.modulate,
              image: AssetImage('assets/pokemonblack.png'),
              fit: BoxFit.cover,
              width: ScreenUtil().setWidth(333),
            ),
          ),
          actions: <Widget>[
/*            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: IconButton(
                padding: EdgeInsets.all(10.0),
                icon: Icon(
                  Icons.menu,
                  size: 28,
                ),
                onPressed: () {
                  // Implement navigation to shopping cart page here...
                  print('Click Action2');
                },
              ),
            ),*/
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: veri,
          builder: (BuildContext context, AsyncSnapshot<Pokedex> gelenPokedex) {
            if (gelenPokedex.connectionState == ConnectionState.waiting) {
              // yuklenıyorsa

              return Center(child: CircularProgressIndicator());
            } else if (gelenPokedex.connectionState == ConnectionState.done) {
              return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 15,
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  children: gelenPokedex.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PokemonDetay2(
                              pokemon: poke,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: poke.img,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(
                              //or with fromRGBO with fourth arg as _random.nextDouble(),
                              150,
                              random.nextInt(255),
                              random.nextInt(255),
                              random.nextInt(255),
                            ),

/*                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8,
                                  0.0), // 10% of the width, so there are ten blinds.
                              colors: [
                                Color.fromARGB(
                                  //or with fromRGBO with fourth arg as _random.nextDouble(),
                                  200,
                                  random.nextInt(75),
                                  random.nextInt(176),
                                  251,
                                ),
                                Color.fromARGB(
                                  //or with fromRGBO with fourth arg as _random.nextDouble(),
                                  200,
                                  30,
                                  random.nextInt(176),
                                  251,
                                ),
                              ], // whitish to gray
                              // repeats the gradient over the canvas
                            ),*/
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 80,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil().setWidth(50),
                                        left: ScreenUtil().setWidth(30),
                                        bottom: ScreenUtil().setWidth(10)),
                                    child: Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setWidth(45),
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: poke.type
                                          .map((tip) => Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: ScreenUtil()
                                                        .setWidth(14),
                                                    left: ScreenUtil()
                                                        .setWidth(20)),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: ScreenUtil()
                                                        .setWidth(20),
                                                    horizontal: ScreenUtil()
                                                        .setWidth(35)),
                                                child: Text(
                                                  tip,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: ScreenUtil()
                                                          .setWidth(35)),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(280),
                                    padding: EdgeInsets.only(
                                        left: ScreenUtil().setWidth(0)),
                                    child: CachedNetworkImage(
                                      imageUrl: poke.img,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,

                                            /* colorFilter: ColorFilter.mode(
                                                  Colors.red, BlendMode.colorBurn)*/
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/pokemonlogo.png"),
                                          width: ScreenUtil().setWidth(40),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList());
            } else {
              // connection yoksa
              return Center(
                child: Text("bulunamadı"),
              );
            }
          },
        ),
      ),
    );
  }
}
