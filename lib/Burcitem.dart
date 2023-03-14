import 'package:flutter/material.dart';
import 'package:flutter_application_1/burcdetay.dart';

import 'Burc_Listesi.dart';

class BurcItem extends StatelessWidget {
  final Burclar gelenBurc;
  const BurcItem({required this.gelenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/images/" + gelenBurc.burckucukResim),
      title: Text(gelenBurc.burcAdi),
      subtitle: Text(gelenBurc.burcTarihi),
      trailing: Icon(Icons.arrow_circle_right_sharp),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BurcDetay(gosterilecekBurc: gelenBurc),
        ));
      },
    );
  }
}
