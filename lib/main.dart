import 'package:engindemirog/models/student.dart';
import 'package:engindemirog/screens/student_add.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

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
  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Volkan", "Aktas", 25,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg"),
    Student.withId(2, "Berk", "Yilmaz", 65,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg"),
    Student.withId(3, "Arif", "Dora", 45,
        "https://cdn.pixabay.com/photo/2020/06/12/12/34/bird-bath-5290285_960_720.jpg")
  ];

  //var ogrenciler = ["Engin Demirog", "vOLKAN AKTAS ", "Ozlem Ezgi Sari "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: buildBody(context));
  }

  // String sinavHesapla(int not) {
  //   String mesaj = "";
  //   if (not >= 50) {
  //     mesaj = "Gecti";
  //   } else if (not >= 40) {
  //     mesaj = "Bute kaldi";
  //   } else {
  //     mesaj = "kaldi";
  //   }
  //   return mesaj;
  // }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
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
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Secili ogrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    var mesaj = "Güncellendi";
                    mesajGoster(context, mesaj);
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });

                    var mesaj = "Silindi : " + selectedStudent.firstName;
                    mesajGoster(context, mesaj);
                  }),
            )
          ],
        ),

        // Center(
        //   child: RaisedButton(
        //       child: Text("Sonucu Gor!!!!!!"),
        //       onPressed: () {
        //         var mesaj = sinavHesapla(50);
        //         mesajGoster(context, mesaj);
        //       }),
        // ),
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
