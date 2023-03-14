import 'package:flutter/material.dart';
import 'package:flutter_application_1/Burcitem.dart';
import 'package:flutter_application_1/strings.dart';

class BurcListesi extends StatelessWidget {
  late List<Burclar> burclar;
  BurcListesi() {
    burclar = _verikaynagiolustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(
              gelenBurc: burclar[index],
            );
          },
          itemCount: 12),
    );
  }

  List<Burclar> _verikaynagiolustur() {
    List<Burclar> geciciBurc = [];
    for (var i = 0; i < 12; i++) {
      var burcismi = Strings.BURC_ADLARI[i];
      var burctarih = Strings.BURC_TARIHLERI[i];
      var burcdetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burckucukresim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var burcbuyukresim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";

      Burclar eklenecekBurc = Burclar(
          burcismi, burctarih, burcdetay, burckucukresim, burcbuyukresim);
      geciciBurc.add(eklenecekBurc);
    }
    return geciciBurc;
  }
}

class Burclar {
  String _burcAdi;
  String _burcTarihi;
  String _burcDetay;
  String _burcKucukResim;
  String _burcBuyukResim;

  get burcAdi {
    return _burcAdi;
  }

  get burcTarihi {
    return _burcTarihi;
  }

  get burcDetay {
    return _burcDetay;
  }

  get burckucukResim {
    return _burcKucukResim;
  }

  get burcbuyukResim {
    return _burcBuyukResim;
  }

  Burclar(this._burcAdi, this._burcTarihi, this._burcDetay,
      this._burcKucukResim, this._burcBuyukResim) {}
}
