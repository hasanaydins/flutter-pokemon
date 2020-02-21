import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'models/Pokedex.dart';
import 'package:shimmer/shimmer.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetay extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetay({this.pokemon});

  @override
  _PokemonDetayState createState() => _PokemonDetayState();
}

class _PokemonDetayState extends State<PokemonDetay> {
  PaletteGenerator paletteGenerator;
  Color baskinRenk = Colors.red;

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(NetworkImage(widget.pokemon.img));
    fPaletGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRengiBul();
  }

  @override
  Widget build(BuildContext context) {
    double devWith = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: baskinRenk,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0,
          backgroundColor: baskinRenk,
        ),
        body: Stack(children: <Widget>[
          Positioned(
              top: 0,
              right: 30,
              child: Icon(
                Icons.favorite_border,
                size: 35,
                color: Colors.white,
              )),
          Positioned(
            top: 80,
            right: 20,
            child: Text(
              "#00" + widget.pokemon.id.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 0,
            left: 30,
            child: Text(
              widget.pokemon.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 38.0,
            left: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.pokemon.type
                  .map((tip) => Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10, right: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          tip,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(18)),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                width: devWith,
                height: devHeight * 6 / 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Weight : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.weight)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Height : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.height)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Weaknesses : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: widget.pokemon.weaknesses
                                      .map(
                                        (tip) => Text(tip + ", "),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Spawn Time : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.spawnTime)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Egg : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.egg)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Candy : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.candy)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Spawn Chance : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(width: 20),
                              Text(widget.pokemon.spawnChance.toString())
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Next Evolution : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.pokemon.nextEvolution != null
                                    ? widget.pokemon.nextEvolution
                                        .map(
                                          (evolution) => Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(evolution.name),
                                          ),
                                        )
                                        .toList()
                                    : [Text("No evolution")],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: -devHeight / 9,
            left: devWith / 4,
            child: Container(
                child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                margin: EdgeInsets.only(top: 200),
                width: 200,
                height: 200,
                child: CachedNetworkImage(
                  width: 200,
                  height: 200,
                  imageUrl: widget.pokemon.img,
                  imageBuilder: (context, imageProvider) => Container(
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
                    width: 50,
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[200],
                        highlightColor: Colors.grey[50],
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    /* ContentPlaceholder(
                                                    height: 150,
                                                    width: 150,
                                                  ),*/
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            )),
          ),
        ]));
  }
}
