import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  String mesaj = "Merhaba ilk uygulama";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Engin Demirog", "vOLKAN AKTAS ", "Ozlem Ezgi Sari "];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(ogrenciler[index]);
                  })),
          Center(
            child: RaisedButton(
                child: Text("Sonucu Gor"),
                onPressed: () {
                  var mesaj = sinavHesapla(50);
                  mesajGoster(context, mesaj);
                }),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int not) {
    String mesaj = "";
    if (not >= 50) {
      mesaj = "Gecti";
    } else if (not >= 40) {
      mesaj = "Bute kaldi";
    } else {
      mesaj = "kaldi";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sinav Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
