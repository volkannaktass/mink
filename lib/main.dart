import 'package:engindemirog/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "Öğrenci Takip Sistemi";
  String mesaj = "qwerty";
  String seciliOgrenci = "abc";

  List<Student> students = [
    Student("Volkan", "Aktas", 25,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg"),
    Student("Berk", "Yilmaz", 65,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg"),
    Student("Arif", "Dora", 45,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg")
  ];

  var ogrenciler = ["Engin Demirog", "vOLKAN AKTAS ", "Ozlem Ezgi Sari "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: buildBody(context));
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

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index]
                          .picsUrl), // adres verip gostermek icin kullanilir
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sinavdan aldigi Not : " +
                        students[index].grade.toString() +
                        " [ " +
                        students[index].getStatus +
                        " ]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        seciliOgrenci = students[index].firstName +
                            " " +
                            students[index].lastName;
                      });

                      print(seciliOgrenci);
                    },
                  );
                })),
        Text("Secili ogrenci : " + seciliOgrenci),
        Center(
          child: RaisedButton(
              child: Text("Sonucu Gor!!!!!!"),
              onPressed: () {
                var mesaj = sinavHesapla(50);
                mesajGoster(context, mesaj);
              }),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      mesaj = "kaldi";
    }
    return Icon(Icons.clear);
  }
}
