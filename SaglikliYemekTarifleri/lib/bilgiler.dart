class YemekTarifleri {

  String baslik;
  String resim;
  int kalori;
  int karbonhidrat;
  int protein;

  YemekTarifleri(this.baslik, this.resim, this.kalori, this.karbonhidrat, this.protein);

}

List<YemekTarifleri> getyemek(){
  return <YemekTarifleri>[
    YemekTarifleri("Karnabahar", "assets/images/karnabahar.jpg", 200, 20, 10),
    YemekTarifleri("Mantar Kavurma", "assets/images/mantarkavurma.jpg", 100, 30, 15),
    YemekTarifleri("Roka Salata", "assets/images/rokasalata.jpg", 100, 10, 20),
    YemekTarifleri("Tahinli Piyaz", "assets/images/tahinlipiyaz.jpg", 190, 35, 12),
    YemekTarifleri("Ilık Nohut", "assets/images/iliknohut.jpg", 250, 65, 30),
  ];
}

class PopularYemekTarifleri{
  String baslik2;
  String resim2;
  int kalori2;
  int karbonhidrat2;
  int protein2;

  PopularYemekTarifleri(this.baslik2, this.resim2, this.kalori2, this.karbonhidrat2, this.protein2);
}
List<PopularYemekTarifleri>getpopular(){
  return<PopularYemekTarifleri>[
    PopularYemekTarifleri("Avokadolu Ton Balıklı Salata", "assets/images/avokadolusalata.jpg", 200, 20, 10),
    PopularYemekTarifleri("Bostana Salatası", "assets/images/bostanasalatasi.jpg", 100, 30, 15),
    PopularYemekTarifleri("Glutensiz Mercimekli Kıtır Ekmek", "assets/images/mercimekliekmek.jpg", 100, 10, 20),
    PopularYemekTarifleri("Leblebili Bol Sebzeli Mücver", "assets/images/mucver.jpg", 190, 35, 12),
    PopularYemekTarifleri("Şekersiz Unsuz Kurabiye", "assets/images/sekersizkurabiye.jpg", 250, 65, 30),
  ];
}
