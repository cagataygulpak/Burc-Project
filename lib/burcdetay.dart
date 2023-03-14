import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'Burc_Listesi.dart';

class BurcDetay extends StatefulWidget {
  final Burclar gosterilecekBurc;
  BurcDetay({required this.gosterilecekBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.yellow;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 250,
              /* title: Text(
                gosterilecekBurc.burcAdi,
                style: TextStyle(fontSize: 20),
              ), */

              floating: true,
              pinned: true,
              backgroundColor: appbarRengi,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/" + widget.gosterilecekBurc.burcbuyukResim,
                  fit: BoxFit.cover,
                ),
                title: Text(widget.gosterilecekBurc.burcAdi,
                    textAlign: TextAlign.end),
                centerTitle: true,
              )),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(8),
                child: Text(
                  widget.gosterilecekBurc.burcDetay,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/" + widget.gosterilecekBurc.burcbuyukResim));
    appbarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
