import 'package:flutter/material.dart';
import 'package:SaglikliYemekTarifleri/sabitler.dart';
import 'package:SaglikliYemekTarifleri/bilgiler.dart';
import 'package:SaglikliYemekTarifleri/ayrintilar.dart';
import 'package:SaglikliYemekTarifleri/Text.dart';

class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> {

  List<bool> secim = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MetinBaslik1('Sağlıklı Tarifler'),

                  SizedBox(
                    height: 32,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      secenek('Sebzeler', 'assets/icons/sebze.png', 0),
                      SizedBox(
                        width: 8,
                      ),
                      secenek('Pilavlar', 'assets/icons/pilav.png', 1),
                      SizedBox(
                        width: 8,
                      ),
                      secenek('Salatalar', 'assets/icons/salata.png', 2),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(
              height: 24,
            ),

            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildtarif(),
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  MetinBaslik2('Popüler', false),

                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),

            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: popular(),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget secenek(String text, String image, int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          secim[index] = !secim[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: secim[index] ? anarenk : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [

            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                image,
                color: secim[index] ? Colors.white : Colors.black,
              ),
            ),

            SizedBox(
              width: 8,
            ),

            Text(
              text,
              style: TextStyle(
                color: secim[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildtarif(){
    List<Widget> list = [];
    for (var i = 0; i < getyemek().length; i++) {
      list.add(buildtarifler(getyemek()[i], i));
    }
    return list;
  }

  Widget buildtarifler(YemekTarifleri tarifler, int index){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Ayrinti(tarifler: tarifler)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Hero(
                tag: tarifler.resim,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(tarifler.resim),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            YemekTarifiBaslik(tarifler.baslik),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Kalori(tarifler.kalori.toString() + " Kcal"),

                Icon(
                  Icons.favorite_border,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> popular(){
    List<Widget> list2 = [];
    for (var i = 0; i < getpopular().length; i++) {
      list2.add(popularr(getpopular()[i]));
    }
    return list2;
  }

  Widget popularr(PopularYemekTarifleri tarifler2){
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tarifler2.resim2),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  YemekTarifiBaslik(tarifler2.baslik2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Kalori(tarifler2.kalori2.toString() + " Kcal"),
                      Icon(
                        Icons.favorite_border,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}