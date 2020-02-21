import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/Pokedex.dart';
import 'package:shimmer/shimmer.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonDetay2 extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetay2({this.pokemon});

  @override
  _PokemonDetayState createState() => _PokemonDetayState();
}

class _PokemonDetayState extends State<PokemonDetay2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  PaletteGenerator paletteGenerator;
  Color baskinRenk = Colors.red;
/*
  WebController webController;
*/

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
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        child: Icon(Icons.ondemand_video),
        backgroundColor: Colors.red,
      ),
      backgroundColor: baskinRenk,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 0,
        backgroundColor: baskinRenk,
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
//                appBar: AppBar(
//                  title: Text(title),
//                ),
          body: Stack(
            children: <Widget>[
              Container(
                color: baskinRenk,
                width: ScreenUtil().setWidth(1125),
              ),
              Positioned(
                right: 0,
                top: ScreenUtil().setWidth(380),
                width: 200,
                child: Container(
                  child: Image(
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    image: AssetImage("assets/pokemonblack.png"),
                  ),
                ),
              ),
              Positioned(
                  top: ScreenUtil().setWidth(76),
                  right: ScreenUtil().setWidth(70),
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
                      fontSize: ScreenUtil().setWidth(60),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: ScreenUtil().setWidth(50),
                left: ScreenUtil().setWidth(100),
                child: Text(
                  widget.pokemon.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setWidth(100),
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: ScreenUtil().setWidth(150),
                left: ScreenUtil().setWidth(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pokemon.type
                      .map(
                        (tip) => Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            tip,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setWidth(43),
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      )
                      .toList(),
                ),
              ),
              /*












              */
              SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setWidth(700),
                    ),
                    //////////////////// TABBAR BAS  ////////////////////
                    PreferredSize(
                      preferredSize: Size.fromHeight(300.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(80),
                          left: ScreenUtil().setWidth(30),
                          right: ScreenUtil().setWidth(30),
                          bottom: ScreenUtil().setWidth(0),
                        ),
                        height: ScreenUtil().setWidth(270),
                        child: TabBar(
                          indicatorColor: Colors.blue,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.only(bottom: 0),
                          labelStyle: TextStyle(color: Colors.white),
                          unselectedLabelColor: Colors.grey,
                          tabs: <Widget>[
                            Tab(
                                child: Text('About',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setWidth(45),
                                        fontWeight: FontWeight.w500))),
                            Tab(
                                child: Text('Weaknesses',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setWidth(45),
                                        fontWeight: FontWeight.w500))),
                            Tab(
                                child: Text('Evolution',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setWidth(45),
                                        fontWeight: FontWeight.w500))),
                            Tab(
                                child: Text('Other',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setWidth(45),
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      ),
                    ),
                    //////////////////// TABBAR BİTİŞ  ////////////////////

                    //////////////////// TABBlarım  ////////////////////
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Center(
                                child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Weight: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 87,
                                        ),
                                        Text(
                                          widget.pokemon.weight,
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Height: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 93,
                                        ),
                                        Text(
                                          widget.pokemon.height,
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Spawn Chance: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          widget.pokemon.spawnChance.toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Spawn Time: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          widget.pokemon.spawnTime.toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Egg: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 120,
                                        ),
                                        Text(
                                          widget.pokemon.egg.toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(45),
                                              fontWeight: FontWeight.bold),
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Candy: ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setWidth(50),
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: 104,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.pokemon.candy,
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setWidth(50),
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            color: Colors.white,
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 2.0,
                              padding: const EdgeInsets.all(30),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 20.0,
                              children: widget.pokemon.weaknesses.map((item) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 0,
                                  color: baskinRenk,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        item,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 26),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Center(
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 1.0,
                                padding: const EdgeInsets.all(30),
                                mainAxisSpacing: 20.0,
                                crossAxisSpacing: 20.0,
                                children: widget.pokemon.nextEvolution != null
                                    ? widget.pokemon.nextEvolution
                                        .map((evolution) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
/*                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment(1,
                                                  0.2), // 10% of the wsdth, so there are ten blinds.
                                              colors: [
                                                Colors.blueAccent,
                                                Colors.indigoAccent
                                              ], // whitish to gray
                                              // repeats the gradient over the canvas
                                            ),*/
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                evolution.name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 23),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PokemonDetay2(
                                                        pokemon: widget.pokemon,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Image(
                                                    image: NetworkImage(
                                                        "http://www.serebii.net/pokemongo/pokemon/${evolution.num}.png")),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList()
                                    : [Center(child: Text("Last evolution"))],
                              ),
                            ),
                          ),
                          Container(
                            child: Center(child: Text("Coming Soon")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: ScreenUtil().setWidth(230),
                left: ScreenUtil().setWidth(250),
                child: Container(
                    child: Hero(
                  tag: widget.pokemon.img,
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(80)),
                    width: ScreenUtil().setWidth(550),
                    height: ScreenUtil().setWidth(550),
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
            ],
          ),
        ),
      ),
    );
  }

/*  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl(
        "https://www.pokemon.com/us/pokedex/${widget.pokemon.name.toLowerCase()}");
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }*/

  _launchURL() async {
    var url =
        "https://www.youtube.com/results?search_query=${widget.pokemon.name.toLowerCase()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
