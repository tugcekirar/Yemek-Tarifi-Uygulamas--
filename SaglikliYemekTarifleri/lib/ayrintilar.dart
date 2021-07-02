import 'package:flutter/material.dart';
import 'package:SaglikliYemekTarifleri/sabitler.dart';
import 'package:SaglikliYemekTarifleri/Text.dart';
import 'package:SaglikliYemekTarifleri/bilgiler.dart';

class Ayrinti extends StatelessWidget {

  final YemekTarifleri tarifler;

  Ayrinti({@required this.tarifler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MetinBaslik1(tarifler.baslik),

                ],
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              height: 310,
              padding: EdgeInsets.only(left: 16),
              child: Stack(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      MetinBaslik2('Besin Değerleri', false),

                      SizedBox(
                        height: 16,
                      ),

                      besindeger(tarifler.kalori, "Kalori", "Kcal"),

                      SizedBox(
                        height: 16,
                      ),

                      besindeger(tarifler.karbonhidrat, "Karbonhidrat", "g"),

                      SizedBox(
                        height: 16,
                      ),

                      besindeger(tarifler.protein, "Protein", "g"),

                    ],
                  ),

                  Positioned(
                    right: -80,
                    child: Hero(
                      tag: tarifler.resim,
                      child: Container(
                        height: 310,
                        width: 310,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(tarifler.resim),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MetinBaslik2('Malzemeler', false),

                  MetinAltBaslik1("400 gr haşlanmış kuru fasulye"),
                  MetinAltBaslik1("1 adet orta boy kırmızı soğan"),
                  MetinAltBaslik1("1/3 bağ frenk maydanoz"),
                  MetinAltBaslik1("2 adet yumurta"),
                  MetinAltBaslik1("4 çorba kaşığı tahin"),
                  MetinAltBaslik1("8 çorba kaşığı zeytinyağı"),
                  MetinAltBaslik1("1 limonun suyu"),
                  MetinAltBaslik1("1 çay kaşığı tuz"),
                  MetinAltBaslik1("1 çay kaşığı pul biber"),

                  SizedBox(height: 16,),

                  MetinBaslik2('Hazırlanışı', false),

                  MetinAltBaslik1("2 adet yumurtayı soğuk suya koyun ve su kaynadıktan sonra 7-8 dakika haşlayın."),
                  MetinAltBaslik1("1 adet kırmızı soğanı piyazlık doğrayın. 400 gr haşlanmış konserve fasulyeyi süzün ve soğanla karıştırın."),
                  MetinAltBaslik1("1/3 bağ frenk maydanozu küçük ağaçlar gibi elinizle yapraklarına ayırın ve bir kısmını servis için ayırıp, kalanını soğan ve fasulyelerin üzerine ekleyin."),
                  MetinAltBaslik1("4 çorba kaşığı tahini, 8 çorba kaşığı zeytinyağını, 1 limonun suyunu, 1 çay kaşığı tuzu ve 1 çay kaşığı pul biberi karıştırarak piyazınıza ekleyin."),
                  MetinAltBaslik1("İyice karıştırıp sosu her tarafına yaydıktan sonra haşlanmış yumurtaları yarısına kadar su dolu bir kavanoza alıp iyice çalkalayın."),
                  MetinAltBaslik1("Yumurtaların kabukları eliniz yakmadan rahatça soyulacaklardır."),
                  MetinAltBaslik1("Yumurta iyice pişmeden çalkalarsanız yumurta içinde dağılabilir."),
                  MetinAltBaslik1("Yumurtaların birini dilimleyip piyazın içine karıştırın."),
                  MetinAltBaslik1("Diğerini ise süslemek için yine dilimleyerek üzerine yerleştirin."),
                  MetinAltBaslik1("Son olarak ayırdığınız frenk maydanozları da üzerine serpin ve servis edin."),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget besindeger(int value, String title, String subTitle){
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}